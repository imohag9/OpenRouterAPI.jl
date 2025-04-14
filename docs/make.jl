using OpenRouterAPI
using Documenter

DocMeta.setdocmeta!(OpenRouterAPI, :DocTestSetup, :(using OpenRouterAPI); recursive=true)

makedocs(;
    modules=[OpenRouterAPI],
    authors="imohag9 <souidi.hamza90@gmail.com> and contributors",
    sitename="OpenRouterAPI.jl",
    format=Documenter.HTML(;
        canonical="https://imohag9.github.io/OpenRouterAPI.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/imohag9/OpenRouterAPI.jl",
    devbranch="main",
)
