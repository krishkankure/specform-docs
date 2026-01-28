# Specform (SPECFORM)

**Specform is a dataset snapshot ledger for reproducible clinical analysis.**  
You work with **dataset aliases** via a notebook-native object: `DatasetRef`.

**Core idea:** immutable **DS** (snapshots) + mutable **alias pointers** (your “current dataset”) + a **DAO** that makes it feel natural.

---

## Install

```bash
pip install specform
```

---

## 3-minute Quickstart (DS + DAO workflow)

### 1) Create a workspace + session

```python
from specform.sdk.specform import Specform

sf = Specform(home=".", author="krish")   # creates/uses .specform in this folder
```

### 2) Add your first dataset snapshot (DS) under an alias

```python
brca = sf.dataset("brca")
brca.add("data/brca.csv", note="raw export")
```

You just created an immutable **Dataset Snapshot (DS)** and pointed alias `brca` at it.

### 3) Load without mutating pointers

```python
df = brca.df()
df.head()
```

### 4) Checkpoint a DataFrame as a new DS (post-QC, feature engineering, etc.)

```python
df_qc = df.dropna()
brca.checkpoint(df_qc, note="drop NA rows")
```

### 5) See history (what changed, when, by who)

```python
hist = brca.history()
hist          # prints a clean table in notebooks
hist.to_df()  # pandas DataFrame if pandas is installed
```

### 6) Jump between versions (two modes)

**A) Mutate the alias pointer (changes “current”)**
```python
brca.use("prev")              # rollback pointer
brca.use("latest")            # jump forward
brca.use(1)                   # set pointer to version 1
```

**B) Non-mutating access (read an old snapshot)**
```python
old = brca.v(1)
old.row_count, old.fingerprint_short, old.presence
old.df().head()
```

### 7) Trust checks (psychological safety)

```python
brca.head()
brca.describe()
brca.verify_current()   # verifies fingerprint against stored bytes (if present)
```

---

## What you should remember

- **DS is immutable** (identity = canonical bytes fingerprint)
- **Aliases are mutable pointers** (your “current dataset”)
- **DatasetRef is the DAO** you use in notebooks
- Notes never affect identity; they’re metadata only

---

## Next

- Go deeper: **Datasets (DS + DAO)** → `datasets/datasetref`
- Portability: export/import/merge/bundles → `portability/export-import`
- CLI (optional): `cli`
- Analysis (AS/ER): tiny end section: `analysis`

---

```{toctree}
:maxdepth: 2
:caption: Specform

concepts/mental-model
datasets/datasetref
datasets/history
portability/export-import
portability/merge
portability/bundles
workspace/workspace
workspace/doctor
cli
analysis
```
