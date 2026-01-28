# History & versions

History is an **append-only ledger** of alias events.

---

## Show history

```python
brca.history()
```

---

## Convert to pandas

```python
brca.history().to_df()
```

---

## Select a version safely

- `brca.v(k)` returns an immutable `DatasetVersion`
- `brca.use(k)` mutates the alias pointer + logs an event

---

## “presence”

Each `DatasetVersion` shows `presence`:

- `present` = bytes exist locally
- `missing` = metadata exists, bytes not present (common after imports)
