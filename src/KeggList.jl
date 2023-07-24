
"""
KEGGAPI.list(database) -> DataFrame

Get a list of entries from a specific database from the KEGG API.

# Examples
```julia-repl
julia> KEGGAPI.list("pathway")
```
"""
# This function retrieves a list of entries from a specific database from the KEGG API.
function list(list::String)
    dbs = [
        "pathway", "brite", "module", "ko", "vg", "vp", "ag", "genome", "compound",
        "glycan", "reaction", "rclass", "enzyme", "network", "variant", "disease", 
        "drug", "dgroup", "organism"
    ]
    kegg_data = 
    if occursin("pathway" , list)
        pathway_parser(list)
    elseif list == "organism"
        organism_parser(list)
    else
        stop("The list you are looking for is not available")
    end
   
    # return the arrays 
    return kegg_data
end


function pathway_parser(pathway::String)
    # Define the URL for the API request.
    url = "https://rest.kegg.jp/list/$pathway"
    response_text = request(url)
    # Split the response into lines
    lines = split(response_text, "\n")
    # initialize the arrays
    id = String[]
    name = String[]
    colnames = ["ID", "Pathway"]
    # loop through the lines and split them into fields
    for line in lines
        fields = split(line, "\t")
        length(fields) == 2 || continue  # Skip rows with less than 2 columns
        push!(id, fields[1])
        push!(name, fields[2])
    end

    kegg_data = KeggPathwayList(url, colnames, [id, name])
    return kegg_data
end


function organism_parser(organism::String)
    # Define the URL for the API request.
    url = "https://rest.kegg.jp/list/$organism"
    response_text = request(url)
    # Split the response into lines
    lines = split(response_text, "\n")
    # initialize the arrays
    tnumber = String[]
    organism = String[]
    species = String[]
    phylogeny = String[]
    colnames = ["T. number", "Organism", "Species", "Phylogeny"]
    # loop through the lines and split them into fields
    for line in lines
        fields = split(line, "\t")
        length(fields) == 4 || continue  # Skip rows with less than 4 columns
        push!(tnumber, fields[1])
        push!(organism, fields[2])
        push!(species, fields[3])
        push!(phylogeny, fields[4])
    end
    # return the organism list
    kegg_data_list = KeggOrganismList(url, colnames, [tnumber, organism, species, phylogeny])
    return kegg_data_list
end
