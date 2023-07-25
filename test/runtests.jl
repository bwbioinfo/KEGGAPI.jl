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
