# Datasets (DS + DatasetRef DAO)

This page is the core Specform surface area.

---

## Create the object

```python
brca = sf.dataset("brca")
```

---

## Add a snapshot from a CSV path

```python
brca.add("data.csv", note="raw")
```

### Return behavior (important)

- `add(...)` returns the **same `DatasetRef`** for fluent notebook flow.
- Use `add_version(...)` if you want an immutable handle back.

```python
v = brca.add_version("data.csv", note="raw")
v.ds_id, v.fingerprint_short, v.row_count, v.presence
```

---

## Load as DataFrame (non-mutating)

```python
df = brca.df()
df_v1 = brca.df(version=1)
df_prev = brca.df(version="prev")
df_latest = brca.df(version="latest")
```

---

## Checkpoint a DataFrame

```python
brca.checkpoint(df, note="post-QC")
```

---

## Version handles (immutable views)

```python
v1 = brca.v(1)
v1.columns
v1.df().head()
```

---

## Move the alias pointer (mutating)

```python
brca.use(2, note="roll forward")
brca.use("prev")      # rollback pointer
brca.use("latest")    # jump forward
```

---

## Inspect quickly

```python
brca.head(10)
brca.describe()
```

---

## Export a snapshot to CSV (non-mutating)

```python
brca.to_csv("out.csv")               # current
brca.to_csv("v1.csv", version=1)     # old version
```

---

## Verify integrity

```python
brca.verify_current()
```

### What verification means

It checks stored bytes against the recorded fingerprint for the current DS.
