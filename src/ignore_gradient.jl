export ignore_gradient, construct_diff_version

using ForwardDiff, ChainRulesCore



"""
    ignore_gradient(x) -> x

Drops the gradient in any computation. In reverse mode it uses ChainRulesCore 
API. In forward mode it simply returns a new number with a zero dual.

"""
ignore_gradient(x) = ChainRulesCore.@ignore_derivatives x
ignore_gradient(x::ForwardDiff.Dual) = typeof(x)(x.value)

"""
    construct_diff_version(f, g) -> pass_trough_function

Constructs a pass trough function for the given function `f` and gradient
function `g`. The pass trough function is a function that returns the same
value as `f` but the gradient is taken from `g`. Optional parameter k controls
the steepnes of the gradient, default is 1.

"""
function construct_diff_version(f, g)
    @inline function pass_trough_function(x::T; k = nothing) where {T}
        if k == nothing
            k = one(T)
        end
        zero = g(x * k) - ignore_gradient(g(x * k))
        return ignore_gradient(f(x)) + zero
    end
    return pass_trough_function
end
