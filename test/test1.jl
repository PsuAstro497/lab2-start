using Test

@testset "Testing solution to Exercise 1" begin

@testset "Running ex1.jl" begin
   include("../ex1.jl")
end;

@testset "Checking for responses" begin
   @test !ismissing(response_1a)
   @test !ismissing(response_1b)
   @test !any(ismissing.(response_1b))
   @test !ismissing(response_1c)
   @test !ismissing(response_1d)
   @test !ismissing(response_1e)
   @test !any(ismissing.(response_1e))


   @test !ismissing(response_2a)
   @test !ismissing(response_2b)
   @test !ismissing(response_2c)
   @test !ismissing(response_2e)
   @test !ismissing(response_2f)

   @test !ismissing(response_3a)
   @test !ismissing(response_3c)
end;

end; # Exercise 1

