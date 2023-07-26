
"""
KEGGAPI.list(database) -> DataFrame

Get a list of entries from a specific database from the KEGG API.

# Examples
```julia-repl
KEGGAPI.list("pathway")
```
"""
function list(list::String)
    # This function retrieves a list of entries from a specific database from the KEGG API.

    # Define the URL for the API request based on the provided 'list' argument.
    url = "https://rest.kegg.jp/list/$list"

    # Make the API request and get the response as text.
    response_text = request(url)

    # Check if the requested 'list' is a "pathway" database.
    if occursin("pathway", list)
        # If the 'list' is a pathway database, call the pathway_parser function to parse the response.
        kegg_data = pathway_parser(response_text, url)
    elseif list == "organism"
        # If the 'list' is "organism," call the organism_parser function to parse the response.
        kegg_data = organism_parser(response_text, url)
    else
        # If the 'list' is neither a pathway database nor "organism," print a message indicating that the requested list is not available.
        print("The list you are looking for is not available")
        kegg_data = []  # You might want to consider returning an empty array or any other appropriate default value.
    end

    # Return the parsed data or an empty array if the data is not available.
    return kegg_data
end
