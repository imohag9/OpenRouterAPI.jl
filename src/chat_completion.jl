
"""
    create_completion(model::String, prompt::String; params::Dict{String,Any}=Dict{String,Any}())

Creates a chat completion.

Args:
    model (String): The name of the model to use for the completion.
    prompt (String): The prompt to use for the completion.
    params (Dict{String,Any}, optional): Additional parameters to pass to the API. Defaults to Dict{String,Any}().

Returns:
    Any: The response from the API.
"""
function create_completion(model::String, prompt::String; params::Dict{String,Any}=Dict{String,Any}())

    messages = [Dict("role" => "user", "content" => prompt)]

    all_params = merge(Dict("model" => model, "messages" => messages), params)

    return make_request("chat/completions", "POST", params=all_params)
end

"""
    formatted_response(model::String, prompt::String; params::Dict{String,Any}=Dict{String,Any}())

Creates a chat completion and returns the formatted response.

Args:
    model (String): The name of the model to use for the completion.
    prompt (String): The prompt to use for the completion.
    params (Dict{String,Any}, optional): Additional parameters to pass to the API. Defaults to Dict{String,Any}().

Returns:
    String: The formatted response from the API.
"""
function formatted_response(model::String, prompt::String; params::Dict{String,Any}=Dict{String,Any}())
    response = create_completion(model, prompt, params=params)
    return response["choices"][1]["message"]["content"]
end

export formatted_response,create_completion