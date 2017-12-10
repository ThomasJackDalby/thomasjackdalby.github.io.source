---
title:  "A Python Module Hell"
date:   "2017-09-28"
---

# A Python Module Hell

Python has many good features, but I find some aspects of it frustrating. For example, I thought I fully understood the whole module/submodule thing... just add a __init__.py file right? Well. After bouldering in with my C# namespace head on, I seemed to hit the "no module named ?!#! exception more than once, so figured I would sit down and learn it once and for all. This blog can serve as a record/tutorial of my findings!

So first up! I created a fake directory structure with all the different referencing scenarios you typically encounter.   

```
test
+-- a.py
+-- package_b
|   +-- b_1.py
|   +-- b_2.py
|   +-- package_d
|   |   +-- d_1.py
|   |   +-- d_2.py
+-- package_c
|   +-- c_1.py
|   +-- c_2.py
```

Now, in order to both make sure all files are called when I run python a.py, we need to import all the files, but I wasn't too worried about this not working, seeing as all the submodules are at the same level or below a.py in the folder structure. 

```python a.py
from package_b.b_1 import B_1
from package_b.b_1 import B_2
from package_c.c_1 import C_1
from package_c.c_2 import C_2
from package_b.package_d.d_1 import D_1
from package_b.package_d.d_2 import D_2
```






