using HorizonSideRobots

function cross!(robot)
    step_Sud=do_upora!(robot, Sud)
    step_West=do_upora!(robot, West)
    mark_direct!(robot)
    do_upora!(robot, West)
    move!(robot, Ost, step_West)
    move!(robot, Nord, step_Sud)
end

function do_upora!(robot::Robot, send::HorizonSide)
    n::Int=0
    while !isborder(robot, send)
        move!(robot, send)
        n+=1
    end
    return n
end

function mark_direct!(robot)
    while isborder(robot, Ost)==false
        for side ∈ (Nord, Sud)
            putmarker!(robot)
            while isborder(robot, side)==false
                move!(robot, side)
                putmarker!(robot)
            end
            if !isborder(robot, Ost)
                move!(robot, Ost)
            end
        end
    end
end   

function HorizonSideRobots.move!(robot, side, num_steps::Integer)
    for _ in 1:num_steps
        move!(robot, side)
    end
end

cross!(Robot(animate=true))