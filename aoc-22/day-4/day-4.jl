input = open("aoc-22/day-4/day-4.txt", "r")
lines = readlines(input)
close(input)

function get_contained_pairs(lines)
    counter = 0
    for line in lines
        elf_1, elf_2 = split(line, ",")
        elf_1_start, elf_1_end = split(elf_1, "-")
        elf_1_start = parse(Int32, elf_1_start)
        elf_1_end = parse(Int32, elf_1_end)
        elf_2_start, elf_2_end = split(elf_2, "-")
        elf_2_start = parse(Int32, elf_2_start)
        elf_2_end = parse(Int32, elf_2_end)
        if elf_2_start <= elf_1_start && elf_2_end >= elf_1_end
            counter = counter + 1
        elseif elf_1_start <= elf_2_start && elf_1_end >= elf_2_end
            counter = counter + 1
        end
    end
    return counter
end

function get_overlaps(lines)
    counter = 0
    for line in lines
        elf_1, elf_2 = split(line, ",")
        elf_1_start, elf_1_end = split(elf_1, "-")
        elf_1_start = parse(Int32, elf_1_start)
        elf_1_end = parse(Int32, elf_1_end)
        elf_2_start, elf_2_end = split(elf_2, "-")
        elf_2_start = parse(Int32, elf_2_start)
        elf_2_end = parse(Int32, elf_2_end)
        elf_1_tasks = range(elf_1_start, elf_1_end)|>collect
        elf_2_tasks = range(elf_2_start, elf_2_end)|>collect
        overlaps = intersect(elf_1_tasks, elf_2_tasks)
        if !isempty(overlaps)
            counter = counter + 1
        end
    end
    return counter
end



p1 = get_contained_pairs(lines)
p2 = get_overlaps(lines)
println(p1)
println(p2)












