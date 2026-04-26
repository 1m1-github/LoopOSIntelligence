module Human

using ZMQ

const SOCKET = Socket(REQ)
connect(SOCKET, "ipc://")

function intelligence(
    model,
    input_system,
    input_user,
    max_output_tokens,
    temperature,
)
    send(socket, input_user)
    recv(socket)
end

ΔEnery(result, model) = 0.0

end
