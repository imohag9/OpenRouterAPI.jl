
"""
    get_all_models()

Retrieves a list of available models from the OpenRouter API.

# Returns
- A list of available models.
"""
function get_all_models()
    try
        result = APIClient.get_models(OPEN_ROUTER_API)
        return result[1]["data"]
    catch e
        (e isa OpenAPI.Clients.ApiException) && println("Error : ", e.error.message)
        (e isa ErrorException) && println("Error : ", e.msg)
    end
end

export get_all_models


"""
    get_credits()

Retrieves the credit balance for the authenticated user.

# Returns
- The credit balance.
"""
function get_credits()
    try
        api_key = get_api_key()
        result = APIClient.get_credits(OPEN_ROUTER_API,api_key)
        return result[1]["data"]
    catch e
        (e isa OpenAPI.Clients.ApiException) && println("Error : ", e.error.message)
        (e isa ErrorException) && println("Error : ", e.msg)
    end
end

export get_credits

"""
    get_meta_key()

Retrieves information about the current API key.

# Returns
- Information about the current API key.
"""
function get_meta_key()
    try
        api_key = get_api_key()
        result = APIClient.get_current_key(OPEN_ROUTER_API,api_key)
        return result[1]["data"]
    catch e
        (e isa OpenAPI.Clients.ApiException) && println("Error : ", e.error.message)
        (e isa ErrorException) && println("Error : ", e.msg)
    end
end

export get_meta_key

using Base64

"""
    encoded_image_url(img_path::String)

Encodes an image file to a base64 data URL.

# Arguments
- `img_path::String`: The path to the image file.

# Returns
- A base64 data URL representing the encoded image.
"""
function encoded_image_url(img_path::String)::String
    data = read(img_path, String)
    encoded_data = String(base64encode(data))
    return "data:image/jpeg;base64,$(encoded_data)"
end

export encoded_image_url


"""
    encoded_pdf_url(pdf_path::String)

Encodes a PDF file to a base64 data URL.

# Arguments
- `pdf_path::String`: The path to the PDF file.

# Returns
- A base64 data URL representing the encoded PDF.
"""
function encoded_pdf_url(pdf_path::String)::String
    data = read(pdf_path, String)
    encoded_data = String(base64encode(data))
    return "data:application/pdf;base64,$(encoded_data)"
end

export encoded_pdf_url