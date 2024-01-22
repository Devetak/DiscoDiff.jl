export heaviside, sign_diff

using NNlib: sigmoid



"""
    heaviside(Number, [steepnes]) -> Number

Implements the Heaviside function in the forward pass. 
It is 1 if x > 0 and 0 otherwise.
The derivative is taken to be the sigmoid. An extra parameter k controls the 
steepnes of the sigmoid, default is 1.

"""
heaviside = construct_diff_version(
    x -> x > zero(typeof(x)) ? one(typeof(x)) : zero(typeof(x)),
    sigmoid,
)



"""
    sign_diff(Number, [steepnes]) -> Number

Implements the sign function in the forward pass. 
It is 1 if x > 0, -1 if x < 0 and 0 if x = 0.
The derivative is taken to be the tanh. An extra parameter k controls the 
steepnes of the sigmoid, default is 1.

"""
sign_diff = construct_diff_version(sign, tanh)
