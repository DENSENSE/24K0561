using HorizonSideRobots

function move_border!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        movetoend!(() -> !isborder(robot, left(side)), robot, side)
        return nothing
    end
    move!(robot, right(side))
    move_border!(robot, side)
    move!(robot, left(side))
end

function left(side::HorizonSide)
    return HorizonSide((Int(side) + 3)%4)
end

function right(side::HorizonSide)
    return HorizonSide((Int(side) + 1)%4)
end


function movetoend!(stop_cond::Function, robot, side)
    while !stop_cond
        while !isborder(robot, side)
            move(robot, side)
        end
    end
end


r = Robot(animate=true)
