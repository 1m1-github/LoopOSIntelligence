module XAI

using HTTP, JSON3, UUIDs

const URL = "https://api.anthropic.com/v1/messages"
const CID = string(uuid4())

function intelligence(
    model,
    input_system,
    input_user,
    max_output_tokens,
    temperature,
)
    headers = [
        "Authorization" => """Bearer $(ENV["X_AI_API_KEY"])""",
        "Content-Type" => "application/json",
        "x-grok-conv-id" => CID,
    ]
    messages = [
        Dict("role" => "system", "content" => input_system),
        Dict("role" => "user", "content" => input_user),
    ]
    body = Dict(
        "model" => model,
        "messages" => messages,
        "temperature" => temperature,
        "max_tokens" => max_output_tokens,
    )
    body_string = JSON3.write(body)
    response = HTTP.post(url, headers, body_string)
    response_body = String(response.body)
    result = JSON3.parse(response_body)
    result["choices"][1]["message"]["content"], ΔEnery(result, model)
end

const MAX_USD_IN_TICKS = 25 * 10^10
ΔEnery(result, model) = result["usage"]["cost_in_usd_ticks"] / MAX_USD_IN_TICKS

end
