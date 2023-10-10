input = open("/home/ws2/Documents/stuff/julianator/advent-of-code/input.txt", "r")
input_data = readlines(input)
close(input)

int_array = zeros(Int32, length(input_data))

for i in eachindex(input_data)
    if isempty(input_data[i])
        continue
    else
        int_array[i] = parse(Float64, input_data[i])
    end
end

tot_calories = Int32[]
global tmp = 0

for i in eachindex(int_array)
    if int_array[i] != 0
        tmp = tmp + int_array[i]
    else
        push!(tot_calories, tmp)
        global tmp = 0
    end
end

println(maximum(tot_calories))

sort!(tot_calories, rev=true)

print(sum(tot_calories[1:3]))


    



