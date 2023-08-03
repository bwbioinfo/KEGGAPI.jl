using Revise
using KEGGAPI
using DataFrames

# Get information about the KEGG database
kegg_info = KEGGAPI.info("kegg");
print(kegg_info)

# Get a list of pathways in the KEGG database
kegg_pathways = KEGGAPI.list("pathway");
DataFrame(
    kegg_pathways.data,  
    kegg_pathways.colnames
    )

# Get a list of pathways in the KEGG database
kegg_pathways_human = KEGGAPI.list("pathway/hsa");
DataFrame(
    kegg_pathways_human.data,  
    kegg_pathways_human.colnames
    )

join(kegg_pathways_human.data[1][1:30] , "+")

# Get a list of organisms in the KEGG database
kegg_organisms = KEGGAPI.list("organism");
@time KEGGAPI.list("organism")
DataFrame(
    kegg_organisms.data, 
    kegg_organisms.colnames
    )

# Find entries in the compound database related to glucose
kegg_find_pathway = KEGGAPI.find("pathway", "glycolysis");
DataFrame(
    kegg_find_pathway.data, 
    kegg_find_pathway.colnames
    )

kegg_find_compound = KEGGAPI.find("compound", "glucose");
kegg_find_compound.url
DataFrame(
    kegg_find_compound.data, 
    kegg_find_compound.colnames
    )

kegg_find_compound = KEGGAPI.find("compound", "100-150","mol_weight");
DataFrame(
    kegg_find_compound.data, 
    kegg_find_compound.colnames
    )

kegg_find_gene = KEGGAPI.find("genes", "glycolysis");
DataFrame(
    kegg_find_gene.data, 
    kegg_find_gene.colnames
    )


kegg_find_compound = KEGGAPI.find("compound", "100-150","mol_weight");
DataFrame(
    kegg_find_compound.data, 
    kegg_find_compound.colnames
    )

kegg_image = KEGGAPI.get_image("hsa00010")
isa(kegg_image, Vector)
save_image(image, "glycolysis.png")

kegg_conv_eco = KEGGAPI.conv("eco", "ncbi-geneid")
DataFrame(
    kegg_conv_eco.data, 
    kegg_conv_eco.colnames
    )

kegg_conv_eco.data[1] |> println

all(
    map(
        element -> length(element) > 0, 
        kegg_conv_eco.data
        )
    )

kegg_link_pathway = KEGGAPI.link("pathway", "hsa");
DataFrame(
    kegg_link_pathway.data, 
    kegg_link_pathway.colnames
    )


genes_array = ["hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458"]
genes_array2 = ["hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458","hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458","hsa:10458", "hsa:10458", "hsa:10458", "hsa:10458"]

push!(genes_array, genes_array2)

kegg_get_genes = KEGGAPI.kegg_get(genes_array)
length(kegg_get_genes[2])
kegg_get_genes[2]


kegg_get_genes = KEGGAPI.kegg_get(genes_array2, "ntseq")

kegg_get_genes[2]