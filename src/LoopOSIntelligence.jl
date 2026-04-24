module LoopOSIntelligence

# todo: too many input tokens => state too big => recover

export intelligence

using LoopOS: TrackedSymbol, Input, Action, Loop, InputPeripheral, OutputPeripheral

include("Caching.jl")
include("State.jl")
include("Human.jl")
include("Local.jl")
include("XAI.jl")
include("Anthropic.jl")
include("Utils.jl")
include("Intelligence.jl")

end
