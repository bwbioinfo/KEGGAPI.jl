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
    @test kegg_pathways != []  # Check if the retrieved list is not empty
    @test_throws KEGGAPI.RequestError KEGGAPI.list("fail")
end

@testset "KEGGAPI.get_image" begin
    # Retrieve an image of a specific pathway from the KEGG API.
    kegg_image = KEGGAPI.get_image("hsa00010")
    @test isa(kegg_image, Vector)  # Check if the retrieve info is a vector
    @test length(kegg_image) > 0  # Check if the retreived vector is not empty
    @test_throws KEGGAPI.RequestError KEGGAPI.get_image("fail")
end

@testset "KEGGAPI.save_image" begin
    # Save an image to a file
    file_name = "image.png"
    kegg_image = KEGGAPI.get_image("hsa00010")
    KEGGAPI.save_image(kegg_image, file_name)
    @test isfile(file_name) #  Check if the retrieved info is a vector
    @test filesize(file_name) > 0  # Check if the retrieved vector is not empty
end
