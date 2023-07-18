using KEGGAPI
using Test

@testset "KEGGAPI.jl" begin
    info = KEGGAPI.info("kegg")
    @test typeof(info) == String
end
