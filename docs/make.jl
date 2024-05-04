using KEGGAPI
using Documenter

DocMeta.setdocmeta!(KEGGAPI, :DocTestSetup, :(using KEGGAPI); recursive=true)

makedocs(;
    modules=[KEGGAPI],
    authors="Nicholas Geoffrion, Maria Victoria Aguilar Pontes",
    repo="https://github.com/bwbioinfo/KEGGAPI.jl/blob/{commit}{path}#{line}",
    sitename="KEGGAPI.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://bwbioinfo.github.io/KEGGAPI.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Manual" => Any[
            "Guide" => "man/guide.md",
            "man/functions.md",
            "man/examples.md",
            "man/workflow.md",
        ],
    ],
)

deploydocs(;
    repo="github.com/bwbioinfo/KEGGAPI.jl",
    devbranch="main",
)
