# Day 1 of Advent of Code 2022

# Read in the input file

input = open("/home/maitrey/Documents/maitrey/julia/advent-of-code/input.txt") do file
    readlines(file)
end

# Convert empty strings to 0 and convert the strings to integers

input = map(x -> x == "" ? 0 : parse(Int64, x), input)


# Get indices of zeros in the input

zero_indices = findall(x -> x == 0, input)

for j in length(zero_indices)
    input[zero_indices[j]] = sum(input[zero_indices[j] + 1:zero_indices[j + 1] - 1])
end

