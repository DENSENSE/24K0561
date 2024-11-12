using HorizonSideRobots

function cross!(robot)
    # Перемещаем робота на север на 5 шагов
    move!(robot, Nord, 5)
    
    # Затем перемещаем робота на восток на 5 шагов
    move!(robot, Ost, 5)
    
    # Обходим все четыре стороны (север, восток, юг, запад), оставляя метки и поворачивая обратно
    for side ∈ (Nord, Ost, Sud, West)
        # Отмечаем прямую линию вдоль заданного направления и возвращаем количество пройденных шагов
        num_steps = mark_direct!(robot, side)
        
        # Поворачиваем сторону на противоположную
        side = inverse(side)
        
        # Перемещаемся вдоль противоположной стороны на ранее отмеченное количество шагов
        move!(robot, side, num_steps)
    end
end

# Реализуем метод `move!`, который перемещает робота вдоль заданной стороны указанное количество раз
function HorizonSideRobots.move!(robot, side, num_steps::Integer)
    for _ in 1:num_steps
        move!(robot, side)
    end
end

# Функция для поворота направления на противоположное
inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4)

# Метод для отметки прямой линии вдоль заданного направления и возврата количества пройденных шагов
function mark_direct!(robot, side)::Int
    n=0
    while isborder(robot, side)==false
        move!(robot, side)
        putmarker!(robot)
        take!(robot)
        n+=1
    end
    return n 
end   

# Запускаем робота с анимацией, чтобы видеть его движение по полю
cross!(Robot(animate=true)) 