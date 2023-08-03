module KEGGAPI

using HTTP

export request, info, list, find, get_image

include("Structures.jl")
include("Parsers.jl")
include("List.jl")
include("Find.jl")
include("Conv.jl")
include("Link.jl")
include("Get.jl")


"""
request(url)

Make a request to the specified URL and return the response body as a string.
If an error occurs, a `RequestError` is thrown.
This function is not intended for direct use. Instead, use the `info`, `list`, and `find`, etc. functions.

# Examples
```julia-repl
request("https://rest.kegg.jp/info/kegg")
```
"""
function request(url::String)
    response = HTTP.get(url, status_exception=false, verbose=false)

    if (response.status == 200)
        return String(response.body)
    else
        throw(
            RequestError(
                """
                Request to $url failed with status code $(response.status)
                Are you sure your URL called a valid KEGG API endpoint?
                """
            )
        )
    end
end


"""
request_other(url)

Make a request to the specified URL and return the response body as a vector.
If an error occurs, a `RequestError` is thrown.
This function is not intended for direct use.

# Examples
```julia-repl
request_other("https://rest.kegg.jp/image/hsa00010")
```
"""
function request_other(url::String)
    response = HTTP.get(url, status_exception=false, verbose=false)

    if (response.status == 200)
        return response.body
    else
        throw(
            RequestError(
                """
                Request to $url failed with status code $(response.status)
                Are you sure your URL called a valid KEGG API endpoint?
                """
            )
        )
    end
end

"""
KEGGAPI.info(database) -> String

Get information about a specific database from the KEGG API.

# Examples
```julia-repl
KEGGAPI.info("kegg")
```
"""
function info(database::String)
    # function to retrieve information about a specific database from the KEGG API.
    # Define the URL for the API request.
    url = "https://rest.kegg.jp/info/$database"
    # Make a request to the URL and convert the response to a string.
    response_text = request(url)
    # Return the lines as a string.
    return response_text
end

"""
KEGGAPI.get_image(pathway) -> Image

Get an image of a specific pathway from the KEGG API.

# Examples
```julia-repl
KEGGAPI.get_image("hsa00010")
```
"""
function get_image(pathway_id::String)
    url = "https://rest.kegg.jp/get/$pathway_id/image"
    response = request_other(url)
    return response
end

"""
KEGGAPI.save_image(image, filename) -> filename

Save an image to a file.

# Examples
```julia-repl
image = KEGGAPI.get_image("hsa00010")
KEGGAPI.save_image(image, "glycolysis.png")
```
"""
function save_image(image::Vector, filename::String)
    # write a test for the above function  in KEGGAPI/test/runtests.jl
    open(filename, "w") do f
        write(f, image)
    end
    return filename
end

end