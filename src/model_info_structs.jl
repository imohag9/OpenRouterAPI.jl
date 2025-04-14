
mutable struct ModelInfo
    name::String
    architecture::Dict{String, Any}
    context_length::Union{Float64, Nothing}
    id::String
    created::Float64
    pricing::Dict{String, Any}
    top_provider::Dict{String, Any}
    description::String
    per_request_limits::Union{Dict{String, Any}, Nothing}

end

"""
    full_models_list()

Retrieves a list of available models from the OpenRouter API.

Returns:
    Vector{ModelInfo}: A vector of ModelInfo structs representing the available models.
"""
function full_models_list()
    api_key = get_api_key()
    headers = Dict("Authorization" => "Bearer $api_key", "Content-Type" => "application/json",
        "HTTP-Referer" => "https://example.com", "X-Title" => "Example App")
    url = OPENROUTER_API * "models"
    try
        response = HTTP.request("GET", url, headers, body=json(Dict{String,Any}()))
        body = String(response.body)
        parsed_json = JSON.parse(body)
        full_models_list = ModelInfo[]

        for model in parsed_json["data"]
            model_data = ModelInfo(values(model)... )
            push!(full_models_list,model_data)

        end
        return full_models_list
    catch e
        println(e)
        error("OpenRouter API request failed: $(e)")
    end
end


"""
    search_model_by_name(input_str::String, full_list::Vector)

Searches for model IDs containing the input string.

Args:
    input_str (String): The string to search for in model IDs.
    full_list (Vector): The list of ModelInfo structs to search in.

Returns:
    Vector{String}: A vector of model IDs that contain the input string.
"""
function search_model_by_name(input_str::String,full_list::Vector)

    result = String[]
    for model_info in full_list
        occursin(input_str,model_info.id) && push!(result,model_info.id)
    end
    return result

end

"""
    get_model_data(model_id::String, full_list::Vector)

Retrieves detailed data for a specific model.

Args:
    model_id (String): The ID of the model to retrieve data for.
    full_list (Vector): The list of ModelInfo structs to search in.

Returns:
    ModelInfo: The ModelInfo struct for the specified model.
"""
function get_model_data(model_id::String,full_list::Vector)

    result = search_model_by_name(model_id,full_list)
    result == [] && error("Please provide a valid model id !!")
    for model_info in full_list
        model_info.id in result && begin
        return model_info
        break
        end
    end
    

end

export full_models_list,search_model_by_name,get_model_data