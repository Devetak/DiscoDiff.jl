export heaviside

using NNlib



"""
    heaviside(Number, [steepnes]) -> Number

Implements the Heaviside function in the forward pass. 
It is 1 if x > 0 and 0 otherwise.
The derivative is taken to be the sigmoid. An extra parameter k controls the 
steepnes of the sigmoid, default is 1.

"""
@inline function heaviside(x::T; k = nothing) where {T}
    if k == nothing
        k = one(T)
    end
    zero_value = sigmoid(k * x) - ignore_gradient(sigmoid(k * x))
    value = (x > zero(T) ? one(T) : zero(T))
    return ignore_gradient(value) + zero_value
end
