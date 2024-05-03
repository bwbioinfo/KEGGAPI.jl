# Some Examples

## Basics

Examples analogous to [KEGG Conv](https://www.kegg.jp/kegg/rest/keggapi.html#conv)

Querying the API for a simple conversion:

```@example
using KEGGAPI
output = KEGGAPI.conv("eco", "ncbi-geneid"); 
```

Outputs a list with
1. The API call
2. The column headers of the call ( if the result is tabular )
3. The data

This allows to easily convert to a data frame:

```@example
using DataFrames
DataFrame(
  output.data,
  output.colnames
)
```

```@example
using KEGGAPI
using DataFrames
output = KEGGAPI.conv("ncbi-geneid", "eco");
DataFrame(
  output.data,
  output.colnames
)
```

```@example
using KEGGAPI
using DataFrames
output = KEGGAPI.conv("ncbi-proteinid", "hsa:10458+ece:Z5100");
DataFrame(
  output.data,
  output.colnames
)
```

```@example
using KEGGAPI
using DataFrames
output = KEGGAPI.conv("genes", "ncbi-geneid:948364");
DataFrame(
  output.data,
  output.colnames
)
```
