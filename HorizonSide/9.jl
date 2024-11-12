using HorizonSideRobots

function chess!(robot)

end
r = Robot(animate=true)

function move!(robot, n, side)
    k = 0
    for _ in 1:n
        move(robot, side)
        k = k + 1
    end
    return k
end