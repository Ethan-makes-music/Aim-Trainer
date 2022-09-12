function love.load()
    love.window.setTitle("Aim trainer v0.0.1")
    target = {}
    target.x = 200
    target.y = 400
    target.radius = 50

    score = 0
    timer = 15
    timerDone = false

    --declares the new font size
    gameFont = love.graphics.newFont(40)
end

function love.draw()
    --sets the color and draws the shape / coloe of your choice
    love.graphics.setColor(51/255, 153/255, 255/255)
    love.graphics.circle("fill", target.x, target.y, target.radius)

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print(score, 0, 0)
    love.graphics.print(timer, 200, -0)
    if timerDone == true and timer == 0 then 
        love.graphics.print("Your score is: " ..score, 400,300)
    end
end

function love.update(dt)
    if timer <= 0 then
      timerDone = true
      love.timer.sleep(5)
      love.event.quit()
    end
    timer = timer - dt
end

function love.mousepressed( x, y, button, istouch, presses )
    if button == 1 then --checks to see if you are clicking the left mouse button
        local mouse2target = distanceBetween(x, y, target.x, target.y)
        if mouse2target < target.radius then
           score = score + 1
           --changes the position of the target when you click it
           target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
           target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
           sound = love.audio.newSource("click.wav", "static")
           sound:play()
        end
    end
end
--this function checks if your mouse is on the target or not
function distanceBetween(x1, y1 ,x2 ,y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end