## Hello World

### Preparation
In python, I have found the `pyomo` package to be the most easily used for this conversion, but others may be just as versatile.

Most of the examples below require an abstract model to be initialized:

```
import pyomo.environ as pyo
from pyomo.environ import AbstractModel, Set, Param, Var, Constraint
import pyomo.dataportal.DataPortal as DataPortal

m = AbstractModel()



































