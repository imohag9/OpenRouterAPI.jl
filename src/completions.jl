
"""
    text_completion(request::TextCompletionRequest; verbose::Bool=false)

Sends a text completion request to the OpenRouter API.

# Arguments
- `request::TextCompletionRequest`: The text completion request object.
- `verbose::Bool`: (optional) If true, returns the full API response. Defaults to false.

# Returns
- The completed text, or the full API response if verbose is true.
"""
function text_completion(request::TextCompletionRequest;verbose::Bool=false)
    try
        api_key = get_api_key()
        result = APIClient.text_completion(OPEN_ROUTER_API,api_key,request)
        response = verbose ?  result :  result[1]["choices"][1]["text"]
        return response

    catch e
        (e isa OpenAPI.Clients.ApiException) && println("Error : ", e.error.message)
        (e isa ErrorException) && println("Error : ", e.msg)
    end
end

export text_completion

"""
    chat_completions(request::ChatCompletionsRequest; verbose::Bool=false)

Sends a chat completion request to the OpenRouter API.

# Arguments
- `request::ChatCompletionsRequest`: The chat completion request object.
- `verbose::Bool`: (optional) If true, returns the full API response. Defaults to false.

# Returns
- The chat completion response, or the full API response if verbose is true.
"""
function chat_completions(request::ChatCompletionsRequest;verbose::Bool=false)
    try
        api_key = get_api_key()
        result = APIClient.chat_completions(OPEN_ROUTER_API,api_key,request)
        response = verbose ?  result :  result[1]["choices"][1]["message"]["content"]
        return response

    catch e
        (e isa OpenAPI.Clients.ApiException) && println("Error : ", e.error.message)
        (e isa ErrorException) && println("Error : ", e.msg)
    end
end

export chat_completions

