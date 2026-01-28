# Workspace

A workspace is any folder containing a `.specform/` directory.

---

## Create / open a workspace

```python
from specform.sdk.specform import Specform

sf = Specform(home=".")
sf.home
sf.aliases()
```

---

## Author attribution

```python
sf = Specform(home=".", author="krish")
```

If author is omitted, ops may attribute using environment defaults (depending on your implementation).
