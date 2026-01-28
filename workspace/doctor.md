# Doctor

`doctor()` inspects workspace health and (optionally) verifies dataset fingerprints.

---

## Workspace health

```python
sf.doctor()
sf.doctor(verify=True, sample=20)
```

---

## Verify a single dataset alias

```python
sf.dataset("brca").verify_current()
```
