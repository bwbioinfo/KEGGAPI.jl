
"""
KEGGAPI.find(database, query) -> KeggTupleList

Find entries in a specific database from the KEGG API.

# Examples
```julia-repl
KEGGAPI.find("compound","glucose")
```
"""
function find(database::String, query::String, option::String = "")
# This function retrieves a list of entries from a specific database from the KEGG API.
    # Construct the URL for the API request
    url = "https://rest.kegg.jp/find/$database/$query/$option"
    # Check if the requested database is a "pathway" database
    if occursin("pathway", database)
        # Make the API request and get the response as text
        response_text = request(url)
        # If the database is a pathway database, parse the response using the pathway_parser function
        kegg_data = pathway_parser(response_text, url)
    # Check if the requested database is a "compound" database
    elseif occursin("compound", database)
        # Make the API request and get the response as text
        response_text = request(url)
        # If the database is a compound database, parse the response using the compound_parser function
        kegg_data = compound_parser(response_text, url, option)
    # Check if the requested database is a "gene" database
    elseif occursin("genes", database)
        # Make the API request and get the response as text
        response_text = request(url)
        # If the database is a compound database, parse the response using the compound_parser function
        kegg_data = genes_parser(response_text, url)
    else
        # If the database is not a pathway database, print a message indicating that the requested list is not available
        print("The find route you are looking for is not available")
        # Return an empty array
        kegg_data = [] 
    end
    # Return the parsed data or an empty array if not available
    return kegg_data
end
