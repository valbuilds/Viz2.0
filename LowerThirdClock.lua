LowerThirdClock = {
    ShowClock = true,
    text = "17:01",
    x = 1525,
    y = 988,
    w = 120,
    h = 50,
    c = ThemeColor,
    Font = love.graphics.newFont("fonts/ReithSansMd.ttf",35)
}

LowerThirdClockShowing = false

function DrawLowerThirdClock()
    love.graphics.setScissor(1525,988,120,50)
        love.graphics.setColor(LowerThirdClock.c)
        love.graphics.rectangle("fill",LowerThirdClock.x,LowerThirdClock.y,LowerThirdClock.w,LowerThirdClock.h)
        love.graphics.setColor(1,1,1,1)
        love.graphics.setFont(LowerThirdClock.Font)
        love.graphics.print(LowerThirdClock.text,LowerThirdClock.x+13,LowerThirdClock.y+1)
    love.graphics.setScissor()
end

function UpdateLowerThirdClock()
    LowerThirdClock.text = os.date("%H:%M")
end

function HideLowerThirdClock()
    if LowerThirdClock.ShowClock == false then return end

    if LowerThirdClockShowing == true then
        LowerThirdClockShowing = false
        Anim.to(LowerThirdClock,0.5,{y = 988-100}):ease("quartin") 
    end
end

function ShowLowerThirdClock()
    if LowerThirdClock.ShowClock == false then return end

    if LowerThirdClockShowing == false then
        LowerThirdClockShowing = true
        LowerThirdClock.y = 988+50
        Anim.to(LowerThirdClock,0.5,{y = 988}):ease("quartout")
    end
end

function HideLowerThirdClockInstant()
    LowerThirdClock.y = 988-100
end