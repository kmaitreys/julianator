input = open("aoc-22/day-5/day-5.txt", "r")
data = readlines(input)


function get_intial_config(data)
    x = findfirst(isempty, data)
    initial_configuration = data[1:x-1]
    num_of_crates = initial_configuration[end]
    crates = split(num_of_crates, r"\s+")
    crates = crates[2:end-1]

    CONFIG = Dict{String, Vector{String}}()

    for i in eachindex(crates)
        CONFIG[crates[i]] = String[]
    end

    return (initial_configuration, crates, CONFIG)
end


function make_config(initial_configuration, crates, CONFIG)
    for j in eachindex(initial_configuration[1:end-1])
        row = collect(Iterators.partition(initial_configuration[j], 4))
        for i in eachindex(row)
            if occursin('[', row[i])
                push!(CONFIG[crates[i]], row[i])
            end   
        end
    end
    return CONFIG
end


function calculate_final_config(CONFIG)
    moves = data[x+1:end]
    for move in moves
        splitted = split(move, " ")
        crates_moved = parse(Int32, splitted[2])
        moved_from = splitted[4]
        moved_to = splitted[6]
        tmp = CONFIG[moved_from][1:crates_moved]
        CONFIG[moved_to] = vcat(tmp, CONFIG[moved_to])
        CONFIG[moved_from] = CONFIG[moved_from][crates_moved+1:end]
    end
    return CONFIG
end

function get_message(CONFIG)
    for (key, value) in pairs(CONFIG)
        print(CONFIG[key][1][2])
    end
end

initial_configuration, crates, CONFIG = get_intial_config(data)
CONFIG = make_config(initial_configuration, crates, CONFIG)
CONFIG = calculate_final_config(CONFIG)
get_message(CONFIG)