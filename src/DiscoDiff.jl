module DiscoDiff

export heaviside

function heaviside(x)
    T = typeof(x)
    return x > zero(T) ? one(T) : zero(T)
end

include("./ignore_gradient.jl")






end
