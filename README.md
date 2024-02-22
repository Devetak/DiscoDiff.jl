# DiscoDiff.jl

 A small package for differentiable discontinuities in Julia. Implements a simple API to generate differentiable discontinuous functions using the pass-through trick. Works both in forward and reverse mode with scalars and arrays.

## Main API

To generate a differentiable function version of a discontinuous function `f` such that the gradient of `f` is the gradient of `g`, simply use:

````julia
new_f = construct_diff_version(f,g)
````

This is used in the case

$$
\frac{df}{dx}
$$

is either not defined or does not have the desired properties. For example where $f$ is the sign function. Sometimes we want to still be able to propagate gradients trough this. In this case we impose

$$
\frac{df}{dx} = \frac{dg}{dx}
$$

Use it as:

```julia
new_f(x)
# control gradient steppes
new_f(2.0, k = 100.0)
```

In the second case we have

$$
\frac{df}{dx}(2.0) = \frac{dg}{dx}(100.0 \cdot 2.0)
$$

Note: to avoid type instabilities ensure $x$ and $k$ are of the same type. The package works both with forward and reverse mode automatic differentiation.

````julia
using Zygote, ForwardDiff
using DiscoDiff
using LinearAlgebra

f(x) = 1.0
g(x) = x
new_f = construct_diff_version(f,g)

f(1.0) == 1.0
Zygote.gradient(new_f, 1.0)[1] == 1.0
ForwardDiff.derivative(new_f, 1.0) == 1.0
````

And it supports not scalar functions

````julia
using Zygote, ForwardDiff
using DiscoDiff
f = construct_diff_version(x -> x, x -> x.^2)
x = rand(10)
f(x) == x
Zygote.jacobian(f, x)[1] == diagm(2 * x)
ForwardDiff.jacobian(f, x) == diagm(2 * x)
````

# Other

We also export to read-made function.

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
heaviside(1.0)
heaviside(1.0, k = 2.0)
```

For the sign function

```julia
sign_diff(2.0)
sign_diff(2.0, k = 2.0)
```



