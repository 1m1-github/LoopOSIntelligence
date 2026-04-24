const JULIA_PREPEND = "```julia\n"
const JULIA_POSTPEND = "\n```"
function extract_julia_blocks(text::String)
    text = strip(text)
    blocks = split(text, JULIA_PREPEND)
    length(blocks) == 1 && return text # no JULIA_PREPEND, all Julia
    result = String[]
    block = blocks[1]
    !isempty(block) && push!(result, comment(block))
    for i = 2:length(blocks)
        block = blocks[i]
        semi_blocks = split(block, JULIA_POSTPEND)
        @assert length(semi_blocks) == 2
        push!(result, strip(semi_blocks[1]))
        push!(result, comment(semi_blocks[2]))
    end
    strip(join(filter(!isempty, result), '\n'))
end
function comment(text)
    isempty(text) && return text
    join(map(t -> "#" * strip(t), split(strip(text), '\n')), '\n')
end
