using Documenter
using YourPackageName

makedocs(
    sitename = "DiscoDiff.jl",
    format = Documenter.HTML(),
    source = "src",
    pages = ["Home" => "index.md", "Guide" => "guide.md"],
)

deploydocs(repo = "github.com/Devetak/DiscoDiff.jl.git", branch = "gh-pages")
