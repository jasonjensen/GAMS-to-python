---
layout: post
title:  Preparation
subtitle: Packages, Solvers
permalink: /preparation/
---

These steps are useful or necessary prior to building the model in python.

## Preparation
### Pyomo
In python, I have found the `pyomo` package to be the most easily used for this conversion, but others may be just as versatile.

Most of the examples below require an abstract model to be initialized:

```python
import pyomo.environ as pyo
from pyomo.environ import AbstractModel, Set, Param, Var, Constraint
import pyomo.dataportal.DataPortal as DataPortal

m = AbstractModel()
```

Most of the notebooks in this repository use a slightly larger import block which includes additional pyomo functions, common libraries like pandas and numpy, as well as some utility functions from the IDAES package.

```python
import pyomo.environ as pyo
from pyomo.environ import AbstractModel, Set, Param, Var, Constraint
import pyomo.dataportal.DataPortal as DataPortal
import pandas as pd
import json
from pyomo.core.expr.numvalue import value as constraintValue
from pyomo.core.util import prod
import idaes.core.util as idaes_utils
from pyomo.core.expr.current import identify_variables
from pyomo.common.collections import ComponentSet
import numpy as np
from openpyxl import load_workbook
```

### Ipopt
Pyomo works with many different optimizers. Ipopt is a free optimizer suitable for non-liniear problems, such as those of many CGE models.

Ipopt is part of the COIN-OR Initiative. The Ipopt project webpage is https://github.com/coin-or/Ipopt.

Windows executables are available from several sources, most notably the [Ipopt releases page](https://github.com/coin-or/Ipopt/releases).

Windows and linux executables are available from the [idaes-ext releases page](https://github.com/IDAES/idaes-ext/releases).

The solver must be in your environment's `PATH` variable or in the current working directory.


































