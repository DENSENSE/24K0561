using HorizonSideRobots

function chessn(robot)
    n = 1
    fill_the_square = true
    make_the_square(robot, n, fill_the_square)
end

function fillmove!(robot, n, fill_the_square)
    for i in 1:n
        made_moves = try_move!(robot, Nord, n, fill_the_square)
        move!(robot, Sud, made_moves, fill_the_square)
        if try_move!(robot, Ost, 1, fill_the_square) == true
            break
        end
    end
    if fill_the_square == true
        return false
    else 
        return true
    end
end
function make_the_square(robot, n, fill_the_square)
    fill_the_square = fillmove!(robot, n, fill_the_square)
    if !isborder(robot, Ost)
        fill_the_square = fillmove!(robot, n, fill_the_square)
    end
end

r = Robot(animate=true)

function try_move!(robot, side)
    
end