export sign_diff



"""
    sign_diff(Number, [steepnes]) -> Number

Implements the sign function in the forward pass. 
It is 1 if x > 0, -1 if x < 0 and 0 if x = 0.
The derivative is taken to be the tanh. An extra parameter k controls the 
steepnes of the sigmoid, default is 1.

"""
function sign_diff(x::T, k = nothing) where {T}
    if k == nothing
        k = one(T)
    end
    zero = tanh(x) - ignore_gradient(tanh(x))
    value = ignore_gradient(sign(x))
    return value + zero
end
