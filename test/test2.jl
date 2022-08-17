using Test

@testset "Testing solution to Exercise 2" begin

@testset "Running ex2.jl" begin
   include("../ex2.jl")
end;

@testset "Checking for responses" begin
   @test !ismissing(response_1a)
   @test !ismissing(response_1b)
   @test !ismissing(response_1c)
   @test !ismissing(response_1d)
   @test !ismissing(response_1e)
   @test !ismissing(response_1f)
   @test !ismissing(response_2a)
   @test !ismissing(response_2b)
   @test !ismissing(response_2c)
   @test !ismissing(response_2e)
   @test !ismissing(response_3a)
   @test !ismissing(response_3b)
   @test !ismissing(response_3d)
end;

end; # Exercise 2

