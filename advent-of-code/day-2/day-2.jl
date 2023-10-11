input = open("/home/ws2/Documents/stuff/julianator/advent-of-code/day-2/day-2.txt", "r")
input_data = readlines(input)
close(input)

function get_score_p1(op_move, pl_move)
    # Values of move
    X = 1
    Y = 2
    Z = 3
    # Win conditions
    if op_move == "A" && pl_move == "Y" || 
        op_move == "B" && pl_move == "Z" || 
        op_move == "C" && pl_move == "X"
        score = 6
    # Draw conditions
    elseif op_move == "A" && pl_move == "X" || 
        op_move == "B" && pl_move == "Y" || 
        op_move == "C" && pl_move == "Z"
        score = 3
    # Losing conditions
    else
        op_move == "A" && pl_move == "Z" || 
        op_move == "B" && pl_move == "X" || 
        op_move == "C" && pl_move == "Y"
        score = 0
    end

    # Update score
    if pl_move == "X"
        score = score + X
    elseif pl_move == "Y"
        score = score + Y
    else
        pl_move == "Z"
        score = score + Z
    end
    return score
end


function get_total_score_p1(input_data)
    total_score_p1 = 0
    for i in eachindex(input_data)
        game = split(input_data[i], " ")
        total_score_p1 = total_score_p1 + get_score_p1(game[1], game[2]) 
    end
    return total_score_p1
end



function get_score_p2(op_move, pl_move)
    # Values of move
    X = 1
    Y = 2
    Z = 3
    # Win conditions
    if pl_move == "Z"
        score = 6
    # Draw condtions
    elseif pl_move == "Y"
        score = 3
    else pl_move == "X"
        score = 0
    end
    # Update score
    if score == 6
        if op_move == "A"
            score = score + Y
        elseif op_move == "B"
            score = score + Z
        else op_move == "C"
            score = score + X
        end
    end
    if score == 3
        if op_move == "A"
            score = score + X
        elseif op_move == "B"
            score = score + Y
        else op_move == "C"
            score = score + Z
        end
    end
    if score == 0
        if op_move == "A"
            score = score + Z
        elseif op_move == "B"
            score = score + X
        else op_move == "C"
            score = score + Y
        end
    end
    return score
end

function get_total_score_p2(input_data)
    total_score_p2 = 0
    for i in eachindex(input_data)
        game = split(input_data[i], " ")
        total_score_p2 = total_score_p2 + get_score_p2(game[1], game[2]) 
    end
    return total_score_p2
end

part_1 = get_total_score_p1(input_data)
part_2 = get_total_score_p2(input_data)

println("The answer to first part is $part_1.")
println("The answer to second part is $part_2.")