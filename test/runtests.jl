using OpenRouterAPI
using Test

@testset "OpenRouterAPI.jl" begin
    @testset "ENV" begin
        # Test that get_api_key() throws an error if the OPENROUTER_API_KEY environment variable is not set
        ENV["OPENROUTER_API_KEY"] = ""
        @test_throws ErrorException OpenRouterAPI.get_api_key()

        # Test that get_api_key() returns the API key if the OPENROUTER_API_KEY environment variable is set
        ENV["OPENROUTER_API_KEY"] = "sk-or"
        @test OpenRouterAPI.get_api_key() == "sk-or"
    end

end
