# OpenRouterAPI

[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://imohag9.github.io/OpenRouterAPI.jl/dev/)
[![Build Status](https://github.com/imohag9/OpenRouterAPI.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/imohag9/OpenRouterAPI.jl/actions/workflows/CI.yml?query=branch%3Amain)

## Introduction

OpenRouter.jl is a Julia package that provides a convenient interface for interacting with the OpenRouter API. It allows you to easily access various language models and perform tasks such as chat completion, model information retrieval, and credit balance checking.

## Installation

To install OpenRouter.jl, use the Julia package manager:

```julia
pkg> add OpenRouterAPI
```

Before using the package, you need to set the `OPENROUTER_API_KEY` environment variable
in a .env file.


## Functions

### `text_completion(request::TextCompletionRequest; verbose::Bool=false)`

Sends a text completion request to the OpenRouter API.

**Purpose:**
Generates text based on a given prompt using the specified model.

**Parameters:**
-   `request::TextCompletionRequest`: A `TextCompletionRequest` object containing the details of the request, such as the model, prompt, and other parameters.
-   `verbose::Bool=false`: An optional boolean parameter. If set to `true`, the function will print verbose output during the API call.

**Return Value:**
The API response containing the generated text.

### `chat_completions(request::ChatCompletionsRequest; verbose::Bool=false)`

Sends a chat completion request to the OpenRouter API.

**Purpose:**
Generates a chat response based on a conversation history.

**Parameters:**
-   `request::ChatCompletionsRequest`: A `ChatCompletionsRequest` object containing the details of the request, such as the model, messages, and other parameters.
-   `verbose::Bool=false`: An optional boolean parameter. If set to `true`, the function will print verbose output during the API call.

**Return Value:**
The API response containing the chat completion.

### `get_all_models()`

Retrieves a list of available models from the OpenRouter API.

**Purpose:**
Fetches a list of models that can be used with the API.

**Parameters:**
None

**Return Value:**
A list of available models.

### `get_credits()`

Retrieves the credit balance for the authenticated user.

**Purpose:**
Checks the remaining credits for the API key.

**Parameters:**
None

**Return Value:**
The credit balance for the user.

### `get_meta_key()`

Retrieves information about the current API key.

**Purpose:**
Fetches metadata associated with the current API key, such as usage limits or other restrictions.

**Parameters:**
None

**Return Value:**
Information about the API key.

## License

This package is licensed under the MIT License.
