using Documenter
using DiscoDiff

makedocs(
    sitename = "DiscoDiff.jl Documentation",
    modules = [DiscoDiff],
    format = Documenter.HTML(pretyurls = false),
    pages = ["Home" => "index.md"],
)
