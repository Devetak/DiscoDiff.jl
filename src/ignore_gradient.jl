export ignore_gradient

using ForwardDiff, ChainRulesCore



"""
    ignore_gradient(x) -> x

Drops the gradient in any computation. In reverse mode it uses ChainRulesCore 
API. In forward mode it simply returns a new number with a zero dual.

"""
ignore_gradient(x) = ChainRulesCore.@ignore_derivatives x
ignore_gradient(x::ForwardDiff.Dual) = typeof(x)(x.value)
