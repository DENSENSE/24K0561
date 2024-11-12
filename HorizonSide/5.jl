using HorizonSideRobots


function candyfined(robot)
    # Перемещаем робота на север на 5 шагов
    move!(robot, Nord, 5)
    
    # Затем перемещаем робота на восток на 5 шагов
    move!(robot, Ost, 5)
    
    num_steps = 0
    while ismarked(x,y) == false

        for side ∈ (Nord, Ost, Sud, West)
            num_steps += 1
            move!(robot, Nord, num_steps)
            move!(robot, Ost, num_steps)
            move!(robot, Sud, num_steps)
            move!(robot, West, num_steps)
        end
        println(num_steps)
    end
    print(ismarked)

end

function HorizonSideRobots.move!(robot, side, num_steps::Integer)
    for _ in 1:num_steps
        move!(robot, side)
    end
end
# Функция для поворота направления на противоположное
inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4)

function mark_direct!(robot, side)::Int
    n=0
    while isborder(robot, side)==false
        move!(robot, side)
        putmarker!(robot)
        n+=1
    end
    return n 
end


# #include ("C:\Users\DEN\Documents\Progr. time\MIREA\5.jl")
# r = Robot(animate=true)
# candyfined(r)