using DiscoDiff, Test, ForwardDiff, NNlib

@testset "heaviside function" begin
    @test heaviside(2.0) == 1.0
    @test heaviside(-2.0) == 0.0
end

@testset "heaviside function gradient" begin
    x = 2.0
    value = NNlib.sigmoid(x)
    f(x) = heaviside(x)
    @test isapprox(
        ForwardDiff.derivative(f, x),
        value * (1.0 - value),
        atol = 1e-8,
    )

end
