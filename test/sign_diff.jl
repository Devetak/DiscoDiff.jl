using DiscoDiff, Test, ForwardDiff

@testset "sign_diff" begin
    @test sign_diff(2.0) == 1.0
    @test sign_diff(-2.0) == -1.0
    @test sign_diff(0.0) == 0.0
end

@testset "sign_diff gradient" begin
    x = 2.0
    f(x) = sign_diff(x)
    value = 1.0 - tanh(x)^2
    @test isapprox(ForwardDiff.derivative(f, x), value, atol = 1e-8)
end
