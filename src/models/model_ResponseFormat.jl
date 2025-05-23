# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""Response_format
response format Description

    ResponseFormat(;
        type=nothing,
        json_schema=nothing,
    )

    - type::String
    - json_schema::ResponseFormatJsonSchema
"""
Base.@kwdef mutable struct ResponseFormat <: OpenAPI.APIModel
    type::Union{Nothing, String} = nothing
    json_schema = nothing # spec type: Union{ Nothing, ResponseFormatJsonSchema }

    function ResponseFormat(type, json_schema, )
        o = new(type, json_schema, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type ResponseFormat

const _property_types_ResponseFormat = Dict{Symbol,String}(Symbol("type")=>"String", Symbol("json_schema")=>"ResponseFormatJsonSchema", )
OpenAPI.property_type(::Type{ ResponseFormat }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_ResponseFormat[name]))}

function OpenAPI.check_required(o::ResponseFormat)
    o.type === nothing && (return false)
    o.json_schema === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::ResponseFormat)
    OpenAPI.validate_property(ResponseFormat, Symbol("type"), o.type)
    OpenAPI.validate_property(ResponseFormat, Symbol("json_schema"), o.json_schema)
end

function OpenAPI.validate_property(::Type{ ResponseFormat }, name::Symbol, val)

    if name === Symbol("type")
        OpenAPI.validate_param(name, "ResponseFormat", :enum, val, ["json_schema"])
    end


end
