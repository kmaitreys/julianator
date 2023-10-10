input = open("/home/ws2/Documents/stuff/julianator/advent-of-code/day-3/day-3.txt", "r")
lines = readlines(input)
close(input)

global total_value = 0

function get_char_value(char)
    if islowercase(char)
        value = Int(char) - 96
    elseif isuppercase(char)
        value = Int(char) - 38
    end
    return value
end

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
    global total_value = total_value + char_value 
end

println(total_value)


elf_groups = []

num_of_elves = length(lines)

for i in 1:3:num_of_elves
    group = []
    append!(group, [lines[i], lines[i+1], lines[i+2]])
    push!(elf_groups, group)
end

global tot_badge_val = 0

for group in elf_groups
    for i in eachindex(group)
        group[i] = Set(group[i])
    end
    result = reduce(intersect, group)
    badge = collect(result)[1]
    badge_val = get_char_value(badge)
    global tot_badge_val = tot_badge_val + badge_val
end

print(tot_badge_val)




