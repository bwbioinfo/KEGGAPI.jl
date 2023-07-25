
"""
KEGGAPI.list(database) -> DataFrame

Get a list of entries from a specific database from the KEGG API.

# Examples
```julia-repl
julia> KEGGAPI.list("pathway")
```
"""
function list(list::String)
    # This function retrieves a list of entries from a specific database from the KEGG API.
    # Define the URL for the API request.
    url = "https://rest.kegg.jp/list/$list"
    response_text = request(url)
    kegg_data = 
        if occursin("pathway" , list)
            pathway_parser(response_text, url)
        elseif list == "organism"
            organism_parser(response_text, url)
        else
            print("The list you are looking for is not available")
        end
    # return the arrays 
    return kegg_data
end

