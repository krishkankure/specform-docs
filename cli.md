# CLI (optional)

The CLI is intentionally thin. It calls the same ops as the SDK.

---

## Common commands

```bash
specform datasets
specform history brca

specform dataset add data/brca.csv --name brca
specform dataset use --name brca --version 2

specform dataset merge brca remote/tcga_brca --dry-run
specform dataset merge brca remote/tcga_brca --note "merge remote"

specform export --out project.sfpack
specform import path/to/project.sfpack

specform doctor --verify --sample 20
```

If you live in notebooks: use the SDK.  
If you want automation/scripts: use the CLI.
