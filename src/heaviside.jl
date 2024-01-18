export heaviside

using NNlib

@inline function heaviside(x::T; k = nothing) where {T}
    if k == nothing
        k = one(T)
    end
    zero_value = sigmoid(k * x) - ignore_gradient(sigmoid(k * x))
    value = (x > zero(T) ? one(T) : zero(T))
    return ignore_gradient(value) + zero_value
end
