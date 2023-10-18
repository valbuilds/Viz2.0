local BreakfastIntroClock = {
    Text = "05:59:59",
    x = 580,
    y = 420,
    --c = {0.95,0.6,0},
    c = {1,1,0.5,0},
    Font = love.graphics.newFont("fonts/ReithSerifRg.ttf",185)
}

local UpdateClock = true

function DrawBreakfastIntroClock()
    love.graphics.setFont(BreakfastIntroClock.Font)
    love.graphics.setColor(BreakfastIntroClock.c)
    love.graphics.print(BreakfastIntroClock.Text,BreakfastIntroClock.x,BreakfastIntroClock.y)
end


function HideBreakfastIntroClock()
    UpdateClock = false
    Timer.tween(0.5,BreakfastIntroClock.c,{[4] = 0})
    Anim.to(BreakfastIntroClock,1,{y = 420-100}):ease("quartout")
end

function HideBreakfastIntroClockInstant()
    UpdateClock = false
    BreakfastIntroClock.c[4] = 0
    BreakfastIntroClock.y = 420-100
end

function ShowBreakfastIntroClock()
    UpdateClock = true
    BreakfastIntroClock.c[4] = 0.7
    BreakfastIntroClock.y = 420
end

function UpdateBreakfastIntroClock()
    if UpdateClock then
        BreakfastIntroClock.Text = os.date("%H:%M:%S")
    end
end
