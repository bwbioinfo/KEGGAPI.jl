# Some Examples

## Basics

Examples analogous to [KEGG Conv](https://www.kegg.jp/kegg/rest/keggapi.html#conv)

```@example
using KEGGAPI
KEGGAPI.conv("eco", "ncbi-geneid")
```

```@example
using KEGGAPI
KEGGAPI.conv("ncbi-geneid", "eco")
```

```@example
using KEGGAPI
KEGGAPI.conv("ncbi-proteinid", "hsa:10458+ece:Z5100")
```

```@example
using KEGGAPI
KEGGAPI.conv("genes", "ncbi-geneid:948364")
```
