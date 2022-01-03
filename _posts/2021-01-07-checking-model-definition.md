---
layout: post
title:  Checking model definition
permalink: /checking-model/

---

This page covers the parts which ensure that the model is feasible and well-defined.

A CGE model must be square, meaning there are an equal number of unknown (unfixed) variables and equations. A non-square model is poorly defined.

The base CGE model must also be feasible. This means that the right and the left side of all equations must be nearly equal given the initial values in the base model without shocks applied.

In GAMS these things are checked explicitly when solving a model, but in python we need some helper functions to perform this check.

### Checking squareness
Checking squareness is not necessarily straightforward. The following helper-function can do it, but sometimes the ipopt solver makes additional optimizations which change the number of effective equations. The best way to check this is to run the solver in a verbose mode.

```python
def count_nonfixed(i, active=True):
    
    num_non_fixed = 0
    num_fixed = 0
    num_vars = 0
    for block in i.block_data_objects(active=active):
        var_set = ComponentSet()
        for c in block.component_data_objects(
                ctype=Constraint, active=True, descend_into=True):
            for v in identify_variables(c.body):
                var_set.add(v)

        for v in var_set:
            if v.is_fixed():
                num_fixed += 1
            else: 
                num_non_fixed += 1
        num_vars = len(var_set)
 
    return num_non_fixed, num_fixed, num_vars

def checkSquareness(inst):
    num_non_fixed, num_fixed, num_vars = count_nonfixed(inst)
    if (num_non_fixed == inst.nconstraints()):
        print('Instance IS SQUARE.')
    else:
        print('Instance is NOT SQUARE!')
```

### Checking feasibility
This function check the initial balance of all the equations in the model and prints out a message if there are any significant inequalities.

```python
def checkFeasibility(inst, limit=1e-9):
    feasible = True
    num_checked = 0
    for block in inst.block_data_objects(active=True):
        for constraint in block.component_map(pyo.Constraint, active=True).values():
            # print(constraint, len(list(constraint._data.keys())), constraint.doc)
            for index in constraint.index_set():
                if index in list(constraint._data.keys()):
                    num_checked = num_checked + 1
                    if abs(constraintValue(constraint[index])) > limit:
                        feasible = False
                        print('Infeasibility:', constraint, index, constraintValue(constraint[index]))
    print(f'Checked {num_checked} constraints.')
    
    if feasible:
        print('All equations balanced. Instance is feasible')
```


### listing instance statistics
The above two checks are usually run on the base instance of the model in the following code-block:

In this case, the `applyFixes` function fixes the variables which must be fixed in all scenarios.

```python
inst_base = m.create_instance()
applyFixes(inst_base, m)

for block in inst_base.block_data_objects(active=True):
    print('variables:          ', idaes_utils.model_statistics.number_variables_in_activated_equalities(block))
    print('  fixed:            ', idaes_utils.model_statistics.number_fixed_variables_in_activated_equalities(block))
    print('  unfixed:          ', idaes_utils.model_statistics.number_unfixed_variables_in_activated_equalities(block))
    print('constraints:        ', idaes_utils.model_statistics.number_activated_equalities(block))
    print('degrees of freedom: ', idaes_utils.model_statistics.degrees_of_freedom(block))
    checkSquareness(block)
    checkFeasibility(block)
    idaes_utils.model_statistics.report_statistics(block)
```





























