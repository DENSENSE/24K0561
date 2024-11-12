using HorizonSideRobots
# Инициализируем робота и устанавливаем его начальную позицию

robot = Robot(animate=true)
max_steps = max_steps!(robot)
println(max_steps)


    
function do_upora!(robot::Robot, send::HorizonSide)
    n::Int=0
    while !isborder(robot, send)
        move!(robot, send)
        n+=1
    end
    return n
end
