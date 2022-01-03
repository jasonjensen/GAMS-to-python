---
layout: post
title:  Helper Functions
permalink: /helper-functions/
---
This page provides some helper functions which significantly simplify the python coding.

### sam
The `sam` function is used to retrieve values from the Social Accounting Matrix. The function requires that a `sam_dict` object exists, but it can be populated at any point prior to calling the sam function. The function takes three arguments:

* **c**: A list of four coordinates to the in the form of TO (A,B) FROM (C, D). These coordinates can be strings or integers. Integers must correcpond to entries in the optional `over` argument.
* **over**: A list of lists for which to return results. For example, if the argument is `[['key1','key2']]` the `sam` function will return a dictionary of results with these keys. If two lists are provided, the function will return a dictionary with tuple combinations of the keys.
* **prices**: A dictionary of prices with which to divide the results by. If multiple lists are provided in the `over` key, the price dictionary must correspond to the first list.

```python
sam_dict = {}

## Make some helper functions
## Dictionary is organized as "FROM (C, D) TO (A, B)"
## But commands will come in form (TO (A, B) FROM (C, D))
def sam(c, over=[], prices=None):
    
    coord = [0,0,0,0]
    d = {}
    p = {}
    if prices:
        if isinstance(prices, int):
            if(len(over) == 1):
                for cat in over[0]:
                    p[cat] = prices
            elif(len(over) == 2):
                for cat in over[1]:
                    p[cat] = prices
            elif (len(over) == 0):
                p['singular'] = prices
        else:
            p = prices
    
    # print(p)
    ## need to loop over levels:
    if (len(over) == 0):
        if ('singular' in list(p.keys())):
            return sam_dict[f"('{c[2]}', '{c[3]}')"][f"('{c[0]}', '{c[1]}')"] / p['singular']    
        else:
            return sam_dict[f"('{c[2]}', '{c[3]}')"][f"('{c[0]}', '{c[1]}')"]
    if len(over) == 1:
        idx = c.index(0)
        for cat in over[0]:
            coord = c.copy()
            coord[idx] = cat
            d[cat] = sam(coord)
            if d[cat] is None: d[cat] = 0 #fix nonetype values
            ## adjust for prices
            if cat in p.keys():
                d[cat] = d[cat]/p[cat]
    if len(over) == 2:
        idx = c.index(0)
        idx2 = c.index(1)
        for cat in over[0]:
            for cat2 in over[1]:
                coord = c.copy()
                coord[idx] = cat
                coord[idx2] = cat2
                d[(cat,cat2)] = sam(coord)
                if d[(cat,cat2)] is None: d[(cat,cat2)] = 0 #fix nonetype values
                ## assume only 2nd variable is adjusted for prices
                if cat in p.keys():
                    d[(cat,cat2)] = d[(cat,cat2)]/p[cat]
  
    return d
```

### val
The `val` function returns a variable or parameter value or dictionary of values from a given model or instance.

```python
## helper function for retriving initial values
def val(obj, sub1=None, sub2=None, default=None):
    try:
        if isinstance(obj, Var):
            if (sub2): return obj._value_init_value[(sub1,sub2)]
            if (sub1): return obj._value_init_value[sub1]
            return obj._value_init_value
        if isinstance(obj, Param):
            values = obj.default()
            if (sub2): return values[(sub1,sub2)]
            if (sub1): return values[sub1]
            return values
    except KeyError:
        if default is not None:
            return default
        else:
            raise
```

































