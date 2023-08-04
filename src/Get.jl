
"""
KEGGAPI.get(query, option) -> Vector

Get entries from across the KEGG database. The get function takes a vector of strings
and returns a vector containing the urls used and the data returned.

The get function will split the vector into groups of 10 and make a request for each chunk.

# Examples
```julia-repl
kegg_get_genes = 
    KEGGAPI.kegg_get(
        ["hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458"], 
        "ntseq"
        )
kegg_get_compounds = 
KEGGAPI.kegg_get(
    ["hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458"], 
    "ntseq"
    )
```
"""
function kegg_get(query::Vector{String}, option::String = "")
# This function retrieves a list of entries from a specific database from the KEGG API.
    chunk_size = 10
    # the maximum number of elements that can be processed in a single request
    query_elements = length(query)
    query_chunks = ceil(Int, query_elements / chunk_size)
    urls = String[]
    data = String[]
    if option == "aaseq" || option == "ntseq"
        if length(query) > 10
            for i in 1:query_chunks
                start_index = (i - 1) * chunk_size + 1
                end_index = min(i * chunk_size, query_elements)
                chunk = query[start_index:end_index]
                chunk_query = join(chunk, "+")
                url = "https://rest.kegg.jp/get/$chunk_query/$option"
                push!(urls, url)
                response_text = request(url)
                for datum in split(response_text, r"(\n>|^>)")[2:end]
                    datum = replace(datum, r"\n$" => "")
                    push!(data, ">"*datum)
                end
                sleep(0.1)
            end
        else
            chunk_query = join(query, "+")
            url = "https://rest.kegg.jp/get/$chunk_query/$option"
            response_text = request(url)
            push!(urls, url)
            for datum in split(response_text, r"(\n>|^>)")[2:end]
                datum = replace(datum, r"\n$" => "")
                push!(data, ">"*datum)
            end
        end
    else
        if length(query) > 10
            for i in 1:query_chunks
                start_index = (i - 1) * chunk_size + 1
                end_index = min(i * chunk_size, query_elements)
                chunk = query[start_index:end_index]
                chunk_query = join(chunk, "+")
                url = "https://rest.kegg.jp/get/$chunk_query/$option"
                push!(urls, url)
                response_text = request(url)
                response_text2 = replace(response_text, r"\n///([^/]*)$" => "")
                for datum in split(response_text2, "\n///\n")
                    push!(data, datum)
                end
                sleep(0.1)
            end
        else
            chunk_query = join(query, "+")
            url = "https://rest.kegg.jp/get/$chunk_query/$option"
            response_text = request(url)
            push!(urls, url)
            response_text2 = replace(response_text, r"\n///([^/]*)$" => "")
            for datum in split(response_text2, "\n///\n")
                push!(data, datum)
            end
        end
    end
   
    
    kegg_data = [urls, data]
    # Return the parsed data or an empty array if not available
    return kegg_data
end
