export ignore_gradient, construct_diff_version

using ForwardDiff, ChainRulesCore



"""
    ignore_gradient(x) -> x

Drops the gradient in any computation. In reverse mode it uses ChainRulesCore 
API. In forward mode it simply returns a new number with a zero dual.

"""
ignore_gradient(x) = ChainRulesCore.@ignore_derivatives x
ignore_gradient(x::ForwardDiff.Dual) = typeof(x)(x.value)

function ignore_gradient(arr::AbstractArray{<:ForwardDiff.Dual})
    return typeof(arr)(ignore_gradient.(arr))
end

"""
    construct_diff_version(f, g) -> pass_trough_function

Constructs a pass trough function for the given function `f` and gradient
function `g`. The pass trough function is a function that returns the same
value as `f` but the gradient is taken from `g`. Optional parameter k controls
the steepnes of the gradient, default is 1. Supports both scalars and arrays.

"""
function construct_diff_version(f, g)
    @inline function pass_trough_function(x::T; k = nothing) where {T}
        if isnothing(k)
            if T <: Number
                k = one(T)
            elseif T <: AbstractArray
                k = one(eltype(T))
            else
                error("Type not supported only supports Number and AbstractArray.")
            end
        end
        zero = g(x .* k) .- ignore_gradient(g(x .* k))
        return ignore_gradient(f(x)) .+ zero
    end
    return pass_trough_function
end
