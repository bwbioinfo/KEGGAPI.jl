using KEGGAPI
using Test
using DataFrames

@testset "KEGGAPI.jl" begin
    # Retrieve information about the KEGG database
    kegg_info = KEGGAPI.info("kegg")
    @test isa(kegg_info, String)  # Check if the retrieved info is a string
    @test length(kegg_info) > 0  # Check if the retrieved info is not empty
    
    # Retrieve a list of KEGG pathways
    kegg_pathways = KEGGAPI.list("pathway")
    @test isa(kegg_pathways, DataFrame)  # Check if the pathways data is a DataFrame
    @test size(kegg_pathways) > (0, 0)  # Check if the pathways data is not empty (has rows and columns)
    
    # Search for information about a specific compound (glucose)
    glucose = KEGGAPI.find("compound", "glucose")
    @test isa(glucose, DataFrame)  # Check if the glucose data is a DataFrame
    @test size(glucose) > (0, 0)  # Check if the glucose data is not empty (has rows and columns)
end
