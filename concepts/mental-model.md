# Mental model (DS, aliases, DAOs)

## The three things

- **Dataset Snapshot (DS):** immutable dataset identity (fingerprint of canonical bytes).
- **Alias:** a local name (e.g., `"brca"`) that points to a DS and has append-only history.
- **DAO (DatasetRef):** the notebook object that resolves aliases, shows history, loads DataFrames, and moves pointers safely.

## The only rule that matters

**DS identity is data-only.**  
Notes, alias names, and user intent do not change fingerprints.

## “use” vs “v()”

- `use(...)` updates the alias pointer and logs an alias event.
- `v(k)` returns an immutable handle to version `k` without touching pointers.
