# Some Examples

## Getting

```@example
using KEGGAPI
KEGGAPI.conv("eco", "ncbi-geneid")
KEGGAPI.conv("ncbi-geneid", "eco")
KEGGAPI.conv("ncbi-proteinid", "hsa:10458+ece:Z5100")
KEGGAPI.conv("genes", "ncbi-geneid:948364")
```
