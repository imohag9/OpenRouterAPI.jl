"""
    get_credits()

Retrieves your OpenRouter API credits.

Returns:
    Dict{String, Any}: The API response as a dictionary.
"""
function get_credits()
    make_request("credits", "GET")["data"]

end


export get_credits