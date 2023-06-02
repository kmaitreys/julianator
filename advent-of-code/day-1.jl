# Fibonacci Sequence function

function fib(n)
    if n < 2
        return n
    else
        return fib(n-1) + fib(n-2)
    end
end

# Call the function
result = fib(10)
println(result)

# Intialize an array
fib_array = []

# Loop through the array
for i in 1:10
    push!(fib_array, fib(i))
end

# Print the array
println(fib_array)