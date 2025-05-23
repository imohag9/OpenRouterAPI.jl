# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.



@doc raw"""Message_content

    MessageContent(; value=nothing)
"""
mutable struct MessageContent <: OpenAPI.AnyOfAPIModel
    value::Any # Union{ String, Vector{Part} }
    MessageContent() = new()
    MessageContent(value) = new(value)
end # type MessageContent

function OpenAPI.property_type(::Type{ MessageContent }, name::Symbol, json::Dict{String,Any})
    
    # no discriminator specified, can't determine the exact type
    return fieldtype(MessageContent, name)
end
