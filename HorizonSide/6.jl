using HorizonSideRobots

function feetfinder(robot)
    ar = corner_way(robot)
    ost_s = do_upora!(robot, Ost)
    sud_s = do_upora!(robot, Sud)
    west_s = do_upora!(robot, West)
    nord_s = do_upora!(robot, Nord)
    for i in 1:length(ar)
        if ((i+2) % 2) == 0
            move!(robot, Sud, ar[length(ar)-i + 1])
            
        else
            move!(robot, Ost, ar[length(ar)-i + 1])
        end
    end
    (x1, y1, x2, y2) = (0, 0, 0, 0)
    for i in 1:length(ar)
        if (i+2) % 2 == 0
            x1 += ar[i]
        else
            y1 += ar[i]
        end
    end
    x2 = 11 - x1
    y2 = 10 - y1
    (d1, d2) = (0, 0)
    # x1 - отсчет слева, y2 - отсчет сверху, x2 - справа, y2 - снизу

    corner_way(robot)

    move!(robot, Ost, x1)
    putmarker!(robot)
    do_upora!(robot, Ost)
    move!(robot, Sud, y1)
    putmarker!(robot)
    do_upora!(robot, Sud)
    move!(robot, West, x2)
    putmarker!(robot)
    do_upora!(robot, West)
    move!(robot, Nord, y2)
    putmarker!(robot)
    do_upora!(robot, Nord)

    for i in 1:length(ar)
        if ((i+2) % 2) == 0
            move!(robot, Sud, ar[length(ar)-i + 1])
            
        else
            move!(robot, Ost, ar[length(ar)-i + 1])
        end
    end

end


function corner_way(robot)
    ar = []
    while !isborder(robot, Nord) || !isborder(robot, West)
        push!(ar, do_upora!(robot, Nord))
        push!(ar, do_upora!(robot, West))
    end
    return ar
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
    for side ∈ (Nord, Ost, Sud, West)
        while isborder(robot, side)==false
            move!(robot, side)
            n += 1
        end
    end
end   

function HorizonSideRobots.move!(robot, side, num_steps::Integer)
    for _ in 1:num_steps
        move!(robot, side)
    end
end

r = Robot(animate=true)