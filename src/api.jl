
const OPENROUTER_API = "https://openrouter.ai/api/v1/"

function make_request(endpoint::String, method::String; params::Dict{String,Any}=Dict{String,Any}())
    api_key = get_api_key()
    headers = Dict("Authorization" => "Bearer $api_key", "Content-Type" => "application/json",
        "HTTP-Referer" => "https://example.com", "X-Title" => "Example App")
    url = OPENROUTER_API * endpoint
    try
        response = HTTP.request(method, url, headers, body=json(params))
        body = String(response.body)
        return JSON.parse(body)
    catch e
        println(e)
        error("OpenRouter API request failed: $(e)")
    end
end

function get_api_key()
    api_key = get(ENV, "OPENROUTER_API_KEY", "")
    if isempty(api_key)
        error("OPENROUTER_API_KEY environment variable not set.")
    end


    return api_key
end