export ignore_gradient

using ForwardDiff, ChainRulesCore

ignore_gradient(x) = ChainRulesCore.@ignore_derivatives x
ignore_gradient(x::ForwardDiff.Dual) = typeof(x)(x.value)
