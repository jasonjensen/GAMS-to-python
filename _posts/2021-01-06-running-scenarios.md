---
layout: post
title:  Running Scenarios
permalink: /running-scenarios/
---

This page covers creating instances, defining the solver, and solving the instances.

### Defining an optimization objective
In pyomo, one final step after defining all the variables, parameters, equations, and their initial values, is to define an optimization target. This does not matter much in a square model where there is likely only one solution, but it can be more relevant if there are more degrees of freedom.

Optimizing for maximum consumption is usually reasonable:
```python
def obj_expression(m):
    return sum(m.C[(i, h)] for i,h in m.commodities_ex_adm*m.households)

m.OBJ = pyo.Objective(rule=obj_expression, sense=pyo.maximize)
```

Another solution would be to minimize the absolute value of the `LEON` variable.

### Creating a base instance
The same fixes must be applied to all scenarios, so it is useful to just have a single function which applies these fixes. Here is a truncated version of such a function:

```python
def applyFixes(inst, m):
    ## fix exchange rate and CAB
    inst.e.fix()
    inst.CAB.fix()

    ## fix labour supply
    inst.LS.fix()
```

With this function applies, the following code creates the base instance from the model `m`:
```python
inst_base = m.create_instance()
applyFixes(inst_base, m)
```

Once created, it is recommended to check for squareness and infeasibility [link].

### Creating other scenarios
In GAMS, variable fixing is done in a very similar fashion, i.e.:

```mathematica
e.fx            = 1;
CAB.fx          = CABO;
```

It is unclear how to run multiple scenarios without simply making changes and re-running the code, or saving the solutions under different names, but there is likely some functionality to do that. 

Here is how to make the scenario changes in the current model code:

```mathematica
** 6.4 Simulations
*  25% increase of international import price of AGR
* PWM.fx('agr')   = PWMO('agr')*1.25;

*  25% decrease of the indirect tax rates on all commodities
* ttix.fx(i)         = ttixO(i)*0.75;

*  20% increase of public expenditures
 G.fx            = GO*1.2;
```

In python, we can create separate instances for each scenario from the same model. Note that scenario changes should be applied to fixed variables, otherwise the changed variable is likely to adjust back to the initial state.

```python
## simulations
inst_scenario_1 = m.create_instance()
inst_scenario_2 = m.create_instance()
inst_scenario_3 = m.create_instance()

applyFixes(inst_scenario_1, m)
applyFixes(inst_scenario_2, m)
applyFixes(inst_scenario_3, m)

## Scenario 1
# 25% increase of international import price of AGR
inst_scenario_1.PWM['AGR'] = 1.25*inst_scenario_1.PWM['AGR'].value

## Scenario 2
# 25% decrease of the indirect tax rates on all commodities
inst_scenario_2.ttix['AGR'] = 0.75*inst_scenario_2.ttix['AGR'].value
inst_scenario_2.ttix['FOOD'] = 0.75*inst_scenario_2.ttix['FOOD'].value
inst_scenario_2.ttix['OTHIND'] = 0.75*inst_scenario_2.ttix['OTHIND'].value
inst_scenario_2.ttix['SER'] = 0.75*inst_scenario_2.ttix['SER'].value

## Scenario 3
#  20% increase of public expenditures
inst_scenario_3.G = 1.2*inst_scenario_3.G.value
```


### Solving models
In GAMS, models are solved using the `SOLVE` command:
```mathematica
option limrow = 10000;
OPTION NLP = conopt3
MODEL PEP11 Standard PEP static model version 2_1 /ALL/;
PEP11.HOLDFIXED=1;
SOLVE PEP11 USING CNS;
```

In python, we need to first create the solver, then run the solver on the instances. It is important to use the `warm_start_init_point` option to ensure the model starts out at the initial values proviced.

Note that these options are specific to the `ipopt` solver. A different solver may have different options.

```python
opt = pyo.SolverFactory('ipopt')
opt.options['max_cpu_time'] = 120 #seconds
opt.options['warm_start_init_point'] = 'yes'
opt.options['halt_on_ampl_error'] = 'yes'
```

In the simplest form, the instance can be solved with the following code:
```python
opt.solve(inst_base)
```

Here is a version with a bit more verboseness. The `tee` option ensures that the solver provides verbose output. The rest of the code provides some helpful messages, depending on hthe solution. 

```python
res_base = opt.solve(inst_base, tee=True)
if (res_base.Solver.Status != 'ok'):
    print('Status NOT ok!')
if (res_base.Solver[0]['Termination condition'] != 'optimal'):
    print('Optimal solution NOT found!')
else:
    print('Optimal solution found!')
res_base
```

Scenarios are solved in the exact same way:
```python
res_scenario_3 = opt.solve(inst_scenario_3, tee=False)
if (res_scenario_3.Solver.Status != 'ok'):
    print('Status NOT ok!')
if (res_scenario_3.Solver[0]['Termination condition'] != 'optimal'):
    print('Optimal solution NOT found!')
else:
    print('Optimal solution found!')
res_scenario_3
```
























