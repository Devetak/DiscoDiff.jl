using DiscoDiff
using Test
using ForwardDiff, Zygote

@testset "ignore gradient" begin

    function f(x)

        return 3x + x^2 - ignore_gradient(x^2)

    end

    x = 2.0
    @test isapprox(ForwardDiff.derivative(f, x), 3 + 2x, atol = 1e-8)
    @test isapprox(Zygote.gradient(f, x)[1], 3 + 2x, atol = 1e-8)

end
