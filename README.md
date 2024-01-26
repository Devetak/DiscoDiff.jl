# DiscoDiff.jl

 A small package for differentiable discontinuities in Julia. Implements a simple API to generate differentiable discontinuous functions using the pass-through trick.

## Main API

To generate a differentiable function version of a discontinuous function `f` such that the gradient of `f` is the gradient of `g`, simply use:

````julia
new_f = construct_diff_version(f,g)

````

Note that it is recommended that `g` satisfies the limit:

$$
\lim_{k \to \infty}g(kx) = f(x).
$$


Use it as:

```julia
new_f(x)
# control gradient steppes
new_f(x, k = 100)

```

Currently supports only scalar to scalar functions. Currently assumes that the discontinuity is at `f(0)` only.


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

We also implement a differentiable version of the sign function defined as:

$$
sign(x) = \begin{cases} 
1 & \text{for } x > 0, \\
0 & \text{for } x = 0, \\
-1 & \text{for } x < 0.
\end{cases}
$$


## Differentiable Discontinuous functions

We implement a differentiable version of the Heaviside function, where the derivative is the derivative of the sigmoid. This function has a "steepness" parameter that controls the transition smoothness. The function is `heaviside(x, k)`.

We implement a differentiable version of the sign function, where the derivative is the derivative of tanh. This function has a "steepness" parameter that controls the transition smoothness. The function is `sign_diff(x, k)` to avoid overriding the Base `sign` function.

- `x`: The input to the function.
- `k`: The steepness parameter. Higher values of `k` make the sigmoid steeper and, hence, closer to the discontinuous function. The default is 1 in all cases.

#### Usage

For the Heaviside function:

```julia
heaviside(1.0) == 1.0
heaviside(1.0, k = 2.0) == 1.0
```

For the sign function

```julia
sign_diff(2.0) == 1.0
sign_diff(2.0, k = 2.0)
```



