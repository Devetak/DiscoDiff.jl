# DiscoDiff.jl

 A small package for differentiable discontinuities in Julia. 

# Heaviside Function Documentation

## Overview

The Heaviside function, also known as the step function, is a discontinuous function named after the British physicist Oliver Heaviside. It is often used in control theory, signal processing, and probability theory.

The Heaviside function is defined as:

$$
H(x) = \begin{cases} 
0 & \text{for } x \leq 0, \\
1 & \text{for } x > 0.
\end{cases}
$$

We also implement a differentiable version of the the sign function defined as:

$$
sign(x) = \begin{cases} 
1 & \text{for } x > 0, \\
0 & \text{for } x = 0, \\
-1 & text{for } x < 0.
\end{cases}
$$


## Differentiable Discontinous functions

We implement a differentiable version of the Heaviside function, where the derivative is the derivative of the sigmoid. This function has a "steepness" parameter that controls the transition smoothness. The function is `heaviside(x, k)`.

We implement a differentiable version of the sign function, where the derivative is the derivative of tanh. This function has a "steepness" parameter that controls the transition smoothness. The function is `sign_diff(x, k)` to avoid overriding the Base `sign` function.

- `x` : The input to the function.
- `k` : The steepness parameter. Higher values of `k` makes the sigmoid steeper and hence closer to the discontinous function. Default is 1 in all cases.

#### Usage

For the Heaviside function:

```julia
heaviside(x_value)
heaviside(x_value, k_value)
```

For the sign function

```julia
sign_diff(x_value)
sign_diff(x_value, k_value)
```



