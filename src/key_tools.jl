
using DotEnv


function get_api_key()
    DotEnv.load!()
    api_key = get(ENV, "OPENROUTER_API_KEY", "")
    if isempty(api_key)
        error("OPENROUTER_API_KEY environment variable not set.")
    end
    return api_key
end