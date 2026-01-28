# Data bundles (share datasets/aliases)

Bundles are for sharing a subset of datasets/aliases cleanly.

---

## Create a bundle plan

```python
bundle = sf.data_bundle("paper_v1", sf.dataset("brca"))
bundle
bundle.datasets
bundle.aliases
```

---

## Export bundle

```python
path = bundle.export("paper_v1.sfds")
path
```

---

## Inspect a bundle (before importing)

```python
report = sf.inspect_data_bundle("paper_v1.sfds")
report
report.to_df()
```

---

## Import a bundle

```python
import_report = sf.import_data_bundle(
    "paper_v1.sfds",
    aliases="recreate",     # or "none"
    conflict="rename",      # or "skip"
)
import_report
import_report.to_df()
```
