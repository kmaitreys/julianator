input = open("advent-of-code/day-3/day-3.txt", "r")
lines = readlines(input)
close(input)


function get_char_value(char)
    if islowercase(char)
        value = Int(char) - 96
    elseif isuppercase(char)
        value = Int(char) - 38
    end
    return value
end

function get_total_value(lines)
    total_value = 0
    for line in lines
        half_length = Int(length(line) / 2)
        first_half = line[1:half_length]
        second_half = line[half_length+1:end]
        first_half_set = Set(first_half)
        second_half_set = Set(second_half)
        common_char_set = intersect(first_half_set, second_half_set)
        common_char_arr = collect(common_char_set)
        common_char = common_char_arr[1]
        char_value = get_char_value(common_char)    
        total_value = total_value + char_value 
    end
    return total_value
end

function get_badge_value(lines)
    total_badge_value = 0
    elf_groups = []
    num_of_elves = length(lines)
    for i in 1:3:num_of_elves
        group = []
        append!(group, [lines[i], lines[i+1], lines[i+2]])
        push!(elf_groups, group)
    end
    for group in elf_groups
        for i in eachindex(group)
            group[i] = Set(group[i])
        end
        result = reduce(intersect, group)
        badge = collect(result)[1]
        badge_val = get_char_value(badge)
        total_badge_value = total_badge_value + badge_val
    end
    return total_badge_value
end


part_1 = get_total_value(lines)
part_2 = get_badge_value(lines)

println("The total value is $part_1.")
println("The total badge value is $part_2.")

