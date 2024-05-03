# Some Examples

## Getting

```@repl
using KEGGAPI
KEGGAPI.conv("eco", "ncbi-geneid")
KEGGAPI.conv("ncbi-geneid", "eco")
KEGGAPI.conv("hsa:10458+ece:Z5100", "ncbi-proteinid")
KEGGAPI.conv("ncbi-geneid:948364", "genes")
```
