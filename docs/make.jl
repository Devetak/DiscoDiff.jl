using Documenter
using DiscoDiff

makedocs(
    sitename = "DiscoDiff.jl Documentation",
    modules = [DiscoDiff],
    format = Documenter.HTML(prettyurls = false),
    pages = ["Home" => "index.md"],
)
