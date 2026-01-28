# Merge (alias histories)

Merge is explicit. Specform never auto-merges aliases.

---

## Merge another alias into this one

```python
brca.merge_from("remote/tcga_brca", note="bring in remote history")
```

---

## Dry run

```python
report = brca.merge_from("remote/tcga_brca", dry_run=True)
report
```

---

## Merge invariants (read once)

- DS identity is global (fingerprint).
- Alias identity is local.
- Merge is a union of histories deduped by DS identity.
- Local history order is preserved; incoming unique snapshots append after it.
