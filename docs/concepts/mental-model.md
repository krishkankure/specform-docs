# Mental model (DS, aliases, DAOs)

---
## Mental model at a glance
```{image} ../figures/mental-model.png
:alt: Specform mental model flowchart
:align: center
:width: 90%
```

Read this diagram **bottom to top**:

1. **Raw data / DataFrame**
2. Canonicalization + hashing → **Dataset Snapshot (DS)**  
3. Alias pointer updated in the registry  
4. Notebook interacts only through **DatasetRef (DAO)**

If you understand this flow, you understand Specform.

## The three things

- **Dataset Snapshot (DS)**  
  Immutable dataset identity.  
  Defined *only* by canonical bytes → fingerprint.

- **Alias**  
  A local, mutable pointer (e.g., `"brca"`) that references a DS.  
  Alias changes are logged as append-only events.

- **DAO (DatasetRef)**  
  The notebook-facing object.  
  It resolves aliases, loads DataFrames, exposes history, and moves pointers safely.

---

## The only rule that matters

**DS identity is data-only.**

Notes, alias names, authors, and intent **never** affect fingerprints.  
If the bytes are identical, the DS is identical — globally.

---

## Pointer movement vs snapshot access

These two operations look similar but mean very different things.

### `use(...)` — mutate state (explicit)

```python
brca.use(2)
```

- Moves the alias pointer
- Appends an alias event
- Changes what “current dataset” means

### `v(k)` — read history (safe)

```python
old = brca.v(1)
```

- Returns an immutable handle
- Does **not** move the alias pointer
- Safe for inspection, comparison, reproduction

---

## One-sentence summary

**Specform separates reality (DS) from perspective (aliases) and gives you a safe, notebook-native handle (DAO) to navigate between them.**


