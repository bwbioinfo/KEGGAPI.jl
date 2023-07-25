var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = KEGGAPI","category":"page"},{"location":"#KEGGAPI","page":"Home","title":"KEGGAPI","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for KEGGAPI.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [KEGGAPI]","category":"page"},{"location":"#KEGGAPI.find-Tuple{String, String}","page":"Home","title":"KEGGAPI.find","text":"KEGGAPI.find(database, query) -> DataFrame\n\nFind entries in a specific database from the KEGG API.\n\nExamples\n\nKEGGAPI.find(\"compound\",\"glucose\")\n\n\n\n\n\n","category":"method"},{"location":"#KEGGAPI.get_image-Tuple{String}","page":"Home","title":"KEGGAPI.get_image","text":"KEGGAPI.get_image(pathway) -> Image\n\nGet an image of a specific pathway from the KEGG API.\n\nExamples\n\nKEGGAPI.get_image(\"hsa00010\")\n\n\n\n\n\n","category":"method"},{"location":"#KEGGAPI.info-Tuple{String}","page":"Home","title":"KEGGAPI.info","text":"KEGGAPI.info(database) -> String\n\nGet information about a specific database from the KEGG API.\n\nExamples\n\nKEGGAPI.info(\"kegg\")\n\n\n\n\n\n","category":"method"},{"location":"#KEGGAPI.list-Tuple{String}","page":"Home","title":"KEGGAPI.list","text":"KEGGAPI.list(database) -> DataFrame\n\nGet a list of entries from a specific database from the KEGG API.\n\nExamples\n\nKEGGAPI.list(\"pathway\")\n\n\n\n\n\n","category":"method"},{"location":"#KEGGAPI.request-Tuple{String}","page":"Home","title":"KEGGAPI.request","text":"request(url)\n\nMake a request to the specified URL and return the response body as a string. If an error occurs, a RequestError is thrown. This function is not intended for direct use. Instead, use the info, list, and find, etc. functions.\n\nExamples\n\nrequest(\"https://rest.kegg.jp/info/kegg\")\n\n\n\n\n\n","category":"method"},{"location":"#KEGGAPI.save_image-Tuple{Vector, String}","page":"Home","title":"KEGGAPI.save_image","text":"KEGGAPI.save_image(image, filename) -> filename\n\nSave an image to a file.\n\nExamples\n\nimage = KEGGAPI.get_image(\"hsa00010\")\nKEGGAPI.save_image(image, \"glycolysis.png\")\n\n\n\n\n\n","category":"method"}]
}
