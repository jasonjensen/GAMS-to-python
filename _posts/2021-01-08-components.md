---
layout: post
title:  CGE Components
subtitle: Sets, Variables, Parameters, Equations
---
This page covers the basic building blocks of a GCE model and how they are written in GAMS and Python.

## Sets
In CGE models, variables and equations are defined across values of sets or combinations of sets. In GAMS, sets are defined like so:

```GAMS
SET

I All commodities
/
 agr             Agriculture and other primary commodities
 food            Food and beverages
 othind          Other manufacturing and construction
 ser             Services
 adm             Public administration
/

;
```

In python, it is most useful to first define a list with the variables, and then define the set.

```python
commodities = [
    'AGR',      # Agriculture and other primary commodities
    'FOOD',     # Food and beverages
    'OTHIND',   # Other manufacturing and construction
    'SER',      # Services
    'ADM'       # Public administration
    ]
  
m.commodities = Set(dimen=1,initialize=commodities, doc='All commodities') 
```

### Subsets
Subsets in both GAMS and python must be defined exactly as sets:
```GAMS
I1(I) All commodities except agriculture
/
* agr             Agriculture and other primary commodities
 food            Food and beverages
 othind          Other manufacturing and construction
 ser             Services
 adm             Public administration
/
```

```python
commodities_ex_agr = ['FOOD','OTHIND','SER','ADM']
m.commodities_ex_agr = Set(dimen=1,initialize=commodities_ex_agr, doc='All commodities except agriculture') 
```

### Aliasing sets
In GAMS, sets which need to be looped over in a nested fashion need to be aliased, so that multiple copies can be used in the same equation. This is done like so:
```GAMS
SET
ALIAS (i,ij)
;
```

In Python, this is generally not required, as these different loops can be handled inline.

## Variables
In GAMS, defining a variable is a four-step process:
* Define a parameter to hold initial values (i.e. EXD0).
* Set the initial values.
* Define the variable (i.e. EXD).
* Set the initial value of the variable to those of the parameter defined in step 1.

```GAMS
PARAMETERS
TICO(i)           Government revenue from indirect taxes on product i
;

TICO(i)         = SAM('AG','TI','I',i);

VARIABLES
TIC(i)          Government revenue from indirect taxes on product i
;

TIC.l(i)        = TICO(i);
```

In python, the variable is defined and initialized in the same step:
```python
m.TIC       = Var(m.commodities, doc='Government revenue from indirect taxes on product i', 
    initialize=sam(['AG','TI','I',0], over=[commodities]))
```
In this case, the variable is initialized with a call to a `sam` function. This is a custom function which retrieves values from the social accounting matrix an returns a dictionary of key-value pairs with the keys matching the values in the commodities list/set. I.e.:
```python
{
  'AGR': 1,
  'FOOD': 2,
  'OTHIND': 3,
  'SER': 4,
  'ADM': 5      
}
```

For variables which are defined across multiple variables, the dictionary keys must be tuples of the combinations, i.e.:
```python
{
  ('FOOD','AGR'): 10
  ('ADM','ADM'): 11
}
```

The variable definition must list the sets at the start of the `Var` call. The consumption variable, for example, is defined across combinations of commodities and households:
```python
m.C     = Var(m.commodities, m.households, doc='Consumption of commodity i by type h households', initialize=sam(['I',0,'AG',1], over=[commodities, households]))
```


## Parameters
Parameters are essentially variables which do not change in value (but also not exactly fixed variables). In GAMS these are defined first with the `PARAMETERS` command, and later provided values with a separate command. In this case the parameter's values are based on the initial values of the VA and XST variables.


```GAMS
PARAMETERS
v(j)              Coefficient (Leontief - value added)
;

v(j)            = VAO(j)/XSTO(j);
```

In python, the code is very similar to the code for variable. In this case, an inline `dict(map(lambda j: , industries))` function is used to generate the dictionary of key-value pairs. Calls to a custom `val` function provide the values from the `m.VA` and `m.XST` variables.

```python
m.v = Param(m.industries, doc='Coefficient (Leontief - value added)', default=dict(map(lambda j: (j,
    val(m.VA,j)/val(m.XST, j)
), industries)))
```

Parameter values cannot be changed unless they are passed the `mutable` argument when defined. This is needed if the parameter is to be adjusted when running different scenarios of the model. Here is an example where the parameter is initialized with a pre-defined `tm` dictionary:

```python
m.tm = Param(m.tradeables, doc='Tax rate on imported commodity tr', initialize=tm, mutable=True)
```

## Equations
In GAMS, equations are declared and then defined, much as with variables and parameters. In this case, equation EQ1 is defined for each of the values of j.
```GAMS
EQUATIONS

 EQ1(j)          Value added demand in industry j (Leontief)
 ;

EQ1(j)..        VA(j) =e= v(j)*XST(j);
```

The equivalent in python is this:

```python
# EQ1(j)          Value added demand in industry j (Leontief)
def EQ1(m, j):
    return m.VA[j] == m.v[j]*m.XST[j]
m.EQ1 = Constraint(m.industries, rule=EQ1, doc='Value added demand in industry j (Leontief)')
```

Note that a function returning the equation is defined first, after which the equation is added to the model. 

Here are equations which are defined for just a single value, or defined for combinations of variables, respectively:

```python
#  EQ22            Total government income
def EQ22(m):
    return m.YG == m.YGK + m.TDHT + m.TDFT + m.TPRODN + m.TPRCTS + m.YGTR
m.EQ22 = Constraint(rule=EQ22, doc='Total government income')

#  EQ9(i,j)        Intermediate consumption of commodity i by industry j (Leontief)
def EQ9(m, i, j):
    return m.DI[(i,j)] == m.aij[(i,j)]*m.CI[j]
m.EQ9 = Constraint(m.commodities, m.industries, rule=EQ9, doc='Intermediate consumption of commodity i by industry j (Leontief)')
```

### Excluding combinations
In GAMS, many equations are only defined over non-zero values of some of the included variables. This is done by including these variables with a `$` sign when defining the equation:
```GAMS
EQ6(l,j)$LDO(l,j)..
                 LD(l,j) =e= [beta_LD(l,j)*WC(j)/WTI(l,j)]**sigma_LD(j)
                             *B_LD(j)**(sigma_LD(j)-1)*LDC(j);
```

In python, this is done by checking initial values and otherwise returning `Constraint.Skip`:
```python
#  EQ6(l,j)        Demand for type l labor by industry j (CES)
def EQ6(m, l, j):
    if val(m.LD, l, j) != 0:
        return m.LD[(l,j)] == ( m.beta_LD[(l,j)]*m.WC[j] / m.WTI[(l,j)])**m.sigma_LD[j]*m.B_LD[j]**(m.sigma_LD[j] - 1)*m.LDC[j] 
    return Constraint.Skip
m.EQ6 = Constraint(m.labour, m.industries, rule=EQ6, doc='Demand for type l labor by industry j (CES)')
```

### Equations using sums and products
Many equations include sums of variables. In GAMS, these are included with the `SUM` command with the last argument being the values to sum and the preceding argument(s) the values to sum over:
```GAMS
EQ13(h)..       YHTR(h) =e= SUM[ag,TR(h,ag)];
```

In python, this is done with a `sum( ... for .. in ..)` construction. The `in` argument can be either a set in the model or a list.
```python
#  EQ13(h)         Transfer income of type h households
def EQ13(m, h):
    return m.YHTR[h] == sum(m.TR[(h,ag)] for ag in m.agents)
m.EQ13 = Constraint(m.households, rule=EQ13, doc='Transfer income of type h households')
```

Some sums are defined only over non-zero or existing values. In GAMS, this is defined in a similar way as when constraining the domain of equations:
```GAMS
EQ11(h)..       YHL(h) =e= SUM{l,lambda_WL(h,l)*W(l)*SUM[j$LDO(l,j),LD(l,j)]};
```

In this case, the second sum is only defined over values of LD where the initial value is existing and non-zero.

In python, this can be done by adding an if statement to the end of the `sum` command and checking the initial value using the custom `val` function.

```python
#  EQ11(h)         Labor income of type h households
def EQ11(m, h):
    return m.YHL[h] == sum(m.lambda_WL[(h,l)]*m.W[l]*sum(m.LD[(l,j)] for j in m.industries
    if val(m.LD, l, j) > 0) for l in m.labour)
m.EQ11 = Constraint(m.households, rule=EQ11, doc='Labor income of type h households')
```

Products are handled in a similar fashion:
```GAMS
EQ82..          PIXINV =e= PROD[i$gamma_INV(i),(PC(i)/PCO(i))**gamma_INV(i)];
```

```python
#  EQ82            Investment price index (derived from investment function)
def EQ82(m):
    return m.PIXINV == prod((m.PC[i]/val(m.PC, i))**m.gamma_INV[i] for i in 
     m.commodities if val(m.gamma_INV,i) > 0)
m.EQ82 = Constraint(rule=EQ82, doc='Investment price index (derived from investment function)')
```