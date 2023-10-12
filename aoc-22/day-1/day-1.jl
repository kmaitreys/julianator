input = open("aoc-22/day-1/day-1.txt", "r")
input_data = readlines(input)
close(input)


function calculate_total_calories(input_data)
    int_array = zeros(Int32, length(input_data))
    for i in eachindex(input_data)
        if isempty(input_data[i])
            continue
        else
            int_array[i] = parse(Int32, input_data[i])
        end
    end
    tot_calories = Int32[]
    tmp = 0
    for i in eachindex(int_array)
        if int_array[i] != 0
            tmp = tmp + int_array[i]
        else
            push!(tot_calories, tmp)
            tmp = 0
        end
    end
    return tot_calories
end

function get_max_calories(total_calories)
    return maximum(total_calories)
end

function get_top_three_sum(total_calories)
    sort!(total_calories, rev=true)
    top_three_sum = sum(total_calories[1:3])
    return top_three_sum    
end

part_1 = get_max_calories(calculate_total_calories(input_data))
part_2 = get_top_three_sum(calculate_total_calories(input_data))

println("The answer to first part is $part_1.")
println("The answer to second part is $part_2.")


    



