export sign_diff

function sign_diff(x::T, k = nothing) where {T}
    if k == nothing
        k = one(T)
    end
    zero = tanh(x) - ignore_gradient(tanh(x))
    value = ignore_gradient(sign(x))
    return value + zero
end
