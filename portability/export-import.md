# Export & import (workspace packs)

Use this to move Specform state between machines or collaborators.

---

## Export

```python
sf.export("project.sfpack")          # exports workspace state (depending on ops settings)
sf.export("brca.sfpack", alias="brca")
```

---

## Import

```python
sf.import_pack("brca.sfpack")
```

Import dedupes snapshots by fingerprint automatically.  
Alias names remain local to the workspace.
