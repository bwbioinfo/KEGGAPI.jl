
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

    # Construct the URL for the API request
    url = "https://rest.kegg.jp/find/$database/$query"

    # Make the API request and get the response as text
    response_text = request(url)

    # Check if the requested database is a "pathway" database
    if occursin("pathway", database)
        # If the database is a pathway database, parse the response using the pathway_parser function
        kegg_data = pathway_parser(response_text, url)
    else
        # If the database is not a pathway database, print a message indicating that the requested list is not available
        print("The list you are looking for is not available")
        kegg_data = []  # You might want to consider returning an empty array or any other appropriate default value
    end

    # Return the parsed data or an empty array if not available
    return kegg_data
end
