
"""
KEGGAPI.find(database, query) -> DataFrame

Find entries in a specific database from the KEGG API.

# Examples
```julia-repl
KEGGAPI.find("compound","glucose")
```
"""
function find(database::String, query::String)
    # This function retrieves a list of entries from a specific database from the KEGG API.
    url = "https://rest.kegg.jp/find/$database/$query"
    response_text = request(url)
    kegg_data = 
        if occursin("pathway" , database)
            pathway_parser(response_text, url)
        else
            print("The list you are looking for is not available")
        end
    # return the arrays 
    return kegg_data
end
