# OpenRouterAPI

[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://imohag9.github.io/OpenRouterAPI.jl/dev/)
[![Build Status](https://github.com/imohag9/OpenRouterAPI.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/imohag9/OpenRouterAPI.jl/actions/workflows/CI.yml?query=branch%3Amain)

## Introduction

OpenRouter.jl is a Julia package that provides a convenient interface for interacting with the OpenRouter API. It allows you to easily access various language models and perform tasks such as chat completion, model information retrieval, and credit balance checking.

## Installation

To install OpenRouter.jl, use the Julia package manager:

```julia
pkg> add OpenRouter
```

Before using the package, you need to set the `OPENROUTER_API_KEY` environment variable.

```julia
ENV["OPENROUTER_API_KEY"] = "your_api_key"
```

## Usage

### Getting Model Information

To retrieve a list of available models, use the `full_models_list()` function:

```julia
using OpenRouter
models = full_models_list()
println(models)
```

To search for a specific model by name, use the `search_model_by_name()` function:

```julia
using OpenRouter
model_name = "meta-llama"
model = search_model_by_name(model_name, full_models_list())
println(model)
```

To get detailed data for a specific model, use the `get_model_data()` function:

```julia
using OpenRouter
model_id = "meta-llama/llama-2-13b-chat"
model_data = get_model_data(model_id, full_models_list())
println(model_data)
```

### Creating Chat Completions

To create a chat completion, use the `create_completion()` function:

```julia
using OpenRouter
model = "meta-llama/llama-2-13b-chat"
prompt = "Write a poem about the rain"
response = create_completion(model, prompt)
println(response)
```

To get a formatted response, use the `formatted_response()` function:

```julia
using OpenRouter
model = "meta-llama/llama-2-13b-chat"
prompt = "Write a poem about the sun"
response = formatted_response(model, prompt)
println(response)
```

### Getting Credits

To retrieve your OpenRouter API credits, use the `get_credits()` function:

```julia
using OpenRouter
credits = get_credits()
println(credits)
```

## API Reference

*   `full_models_list()` - Retrieves a list of available models from the OpenRouter API.
*   `search_model_by_name(input_str::String, full_list::Vector)` - Searches for models by name in a given list.
*   `get_model_data(model_id::String, full_list::Vector)` - Retrieves detailed data for a specific model.
*   `create_completion(model::String, prompt::String; params::Dict{String,Any}=Dict{String,Any}())` - Creates a chat completion using the OpenRouter API.
*   `formatted_response(model::String, prompt::String; params::Dict{String,Any}=Dict{String,Any}())` - Creates a chat completion and returns the formatted response.
*   `get_credits()` - Retrieves your OpenRouter API credits.

## License

This package is licensed under the MIT License.
