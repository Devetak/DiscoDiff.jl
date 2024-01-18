using DiscoDiff, Test

@testset "heaviside function" begin
    @test heaviside(2.0) == 1.0
    @test heaviside(-2.0) == 0.0
end

include("./ignore_gradient.jl")
