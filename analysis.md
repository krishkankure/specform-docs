# Analysis (AS/ER) — minimal

Most users only need DS + DatasetRef.

---

## What exists

- **DraftSpec**: mutable working intent (edit/run loop)
- **AS (Analysis Spec)**: immutable compiled intent (pinned DS + params)
- **ER (Execution Receipt)**: immutable record of what ran and what happened

---

## SDK entry points

```python
spec = sf.spec("cox_primary")     # SpecRef (alias)
draft = sf.draft("cox_primary")   # DraftSpec (loads a draft by name)
```

---

## Reproduce a past run (ER → new ER)

```python
run2 = sf.reproduce(receipt_id="er_...")
run2
```

That’s it for now. Keep analysis docs small until the spec API stabilizes.
