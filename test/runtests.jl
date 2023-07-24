using KEGGAPI
using Test

@testset "KEGGAPI.jl" begin
    # Retrieve information about the KEGG database
    kegg_info = KEGGAPI.info("kegg")
    @test isa(kegg_info, String)  # Check if the retrieved info is a string
    @test length(kegg_info) > 0  # Check if the retrieved info is not empty
    @test_throws KEGGAPI.RequestError KEGGAPI.info("fail")
    
    # Retrieve a list of KEGG pathways
    kegg_pathways = KEGGAPI.list("pathway")
    
    # Search for information about a specific compound (glucose)
    glucose = KEGGAPI.find("compound", "glucose")
end
