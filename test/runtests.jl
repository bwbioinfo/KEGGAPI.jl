using KEGGAPI
using Test

@testset "KEGGAPI.info" begin
    # Retrieve information about a specific database from the KEGG API
    kegg_info = KEGGAPI.info("kegg")
    @test isa(kegg_info, String)  # Check if the retrieved info is a string
    @test length(kegg_info) > 0  # Check if the retrieved info is not empty
    @test_throws KEGGAPI.RequestError KEGGAPI.info("fail")
end

@testset "KEGGAPI.list" begin
    # Retrieve a list of KEGG pathways
    kegg_pathways = KEGGAPI.list("pathway")
    @test isa(kegg_pathways, KEGGAPI.KeggPathwayList)  # Check if the retrieved info is a list
    @test kegg_pathways != []  # Check if the retrieved list is not empty
    @test_throws KEGGAPI.RequestError KEGGAPI.list("fail")
end

@testset "KEGGAPI.get_image" begin
    # Retrieve an image from the KEGG API.
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
    @test isfile(file_name) #  Check if the file exist
    @test filesize(file_name) > 0  # Check if file is not empty
end

@testset "KEGGAPI.conv" begin
    # Convert KEGG identifiers to/from outside database
    kegg_conv = KEGGAPI.conv("eco", "ncbi-geneid")
    @test isa(kegg_conv, KEGGAPI.KeggOrganismList)  # Check if the retrieve info is a list
    @test kegg_conv != []  # Check if retreived list is not empty
end

@testset "KEGGAPI.find" begin
    # Find entries in a specific database from the KEGG API
    kegg_find = KEGGAPI.find("pathway", "glycolysis")
    @test isa(kegg_find, KEGGAPI.KeggPathwayList)  # Check if the retrieve info is a list
    @test kegg_find != []  # Check if retrieve list is not empty
end

@testset "KEGGAPI.link" begin
    # Find related entries by using database cross-references
    kegg_link = KEGGAPI.link("pathway", "hsa")
    @test isa(kegg_link, KEGGAPI.KeggOrganismList)  # Check if the retreive info is a list
    @test kegg_link != []  # Check if retreinve list is not empty
end
