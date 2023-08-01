using KEGGAPI
using Test

@testset "KEGGAPI.info" begin
    # Retrieve information about the KEGG database
    kegg_info = KEGGAPI.info("kegg")
    @test isa(kegg_info, String)  # Check if the retrieved info is a string
    @test length(kegg_info) > 0  # Check if the retrieved info is not empty
    @test_throws KEGGAPI.RequestError KEGGAPI.info("fail")
end

@testset "KEGGAPI.list" begin
    # Retrieve a list of KEGG pathways
    kegg_pathways = KEGGAPI.list("pathway")
    @test isa(kegg_pathways, KEGGAPI.KeggPathwayList)  # Check if the retrieved info is a string
end

@testset "KEGGAPI.get_image" begin
    # Retrieve an image of a specific pathway from the KEGG API.
    kegg_image = KEGGAPI.get_image("hsa00010")
    @test isa(kegg_image, Vector)  # Check if the retrieve info is a vector
    @test length(kegg_image) > 0  # Check if the retreived vector is not empty
    @test_throws KEGGAPI.RequestError KEGGAPI.get_image("fail")
end