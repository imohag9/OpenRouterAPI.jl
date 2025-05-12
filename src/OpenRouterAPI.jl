module OpenRouterAPI
using OpenAPI

include("APIClient.jl")
using .APIClient

include("key_tools.jl")

include("utils.jl")
include("completions.jl")


const CLIENT = OpenAPI.Clients.Client(APIClient.basepath(APIClient.DefaultApi))
const OPEN_ROUTER_API = APIClient.DefaultApi(CLIENT)


end
