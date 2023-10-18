--[[
    MADE BY PLAYSAMAY4 (Discord: playsamay4#3646)
    DO NOT REDISTRIBUTE WITHOUT PERMISSION

    Viz2.0
]]


Anim = require "flux"
Timer = require "timer"
inspect = require "inspect"
local sock = require "sock"
local ShowBG = false
KeepTopText = ""
KeepBottomText = ""
EnableBadge = false

newsTitle = love.graphics.newImage("BBCbox.png")
worldTitle = love.graphics.newImage("worldbox.png")

server = sock.newServer("*", 10655)


--ThemeColor = {0.68,0,0}
ThemeColor = {185/255, 0,0}

require "Headlines"
require "PlaceName"
require "TitleLogo"
require "Transition"
require "Ticker"
require "requests"
require "LowerThirdFull"
require "BreakfastIntroClock"
require "LowerThirdClock"
require "Flash"
require "AVplayout"
require "requests2"

waterMark = true
waterMarkFade = {a = 1}
local waterMarkFont = love.graphics.newFont("ReithSansMd.ttf",40)

function love.load()
    bg = love.graphics.newImage("backdrop.png")

    Fader = love.graphics.newImage("HeadlineFade.png")

    BBCSmall = love.graphics.newImage("WhiteLogoTransparent.png")

    ReithSerif = love.graphics.newFont("ReithSerifRg.ttf",130)
    ReithSansBold = love.graphics.newFont("ReithSansBd.ttf",30)
    ReithSansRegular = love.graphics.newFont("ReithSansRg.ttf",30)
    ReithSansMedium = love.graphics.newFont("ReithSansMd.ttf",30)

    TickerFont = love.graphics.newFont("ReithSansMd.ttf",32)
    PresenterName = love.graphics.newFont("ReithSerifMd.ttf",56)

end

--Fix the ticker scissore8938e098e0982093e80128039ec821930c82913ec209318e9038e9c0382ec0918c092
function love.update(dt)

    if love.thread.getChannel("tcpThreadData"):getCount() > 0 then
        local data = love.thread.getChannel("tcpThreadData"):pop()
        if data == "Connect" then 
            Timer.tween(0.8, waterMarkFade, {a = 0}, "in-out-cubic", function()
                waterMark = false
            end)
        end
    end

    Anim.update(dt)
    Timer.update(dt)
    server:update()

    UpdateBreakfastIntroClock()
    UpdateLowerThirdClock()
    UpdateAVplayout(dt)
end

-- Timer.after(1.5, function()
--     Timer.tween(0.8, waterMarkFade, {a = 0}, "in-out-cubic", function()
--         waterMark = false
--     end)
-- end)

function love.draw()
    love.graphics.setBackgroundColor(0,0,0,0)
    if ShowBG then 
        love.graphics.setColor(1,1,1,1)
        love.graphics.draw(bg,0,0,0,2,2)
    end

    DrawAVplayout()

    DrawTransition()

    DrawFlash()

    DrawLowerThirdFull()

    DrawPlaceName()

    DrawTitleLogo()

    DrawBreakfastIntroClock()

    DrawLowerThirdClock()
    
    if Single then DrawHeadlineSingle() else DrawHeadlineDouble() end



    if waterMark == true then
        love.graphics.setColor(0.2,0.2,0.2,waterMarkFade.a)
        love.graphics.rectangle("fill",0,0,1920,1080)
        love.graphics.setColor(1,1,1,waterMarkFade.a)
        love.graphics.setFont(waterMarkFont)
        love.graphics.print("Made by playsamay4#3646\n\nDO NOT REDISTRIBUTE WITHOUT PERMISSION\n\nWaiting for connection from VizHelper...", 100, 500)
        love.graphics.print("Viz2.0", 1700,1000)
        
    end
    
end
function love.keypressed(key)
    if key == "escape" then love.event.quit() end

    if key == "lalt" then
        HidePlaceName()
    end

    if key == "lshift" then
        ShowTitleLogo()
    end
    if key == "rshift" then
        HideTitleLogo()
    end

    if key == "space" then
        ShowTransition()
    end

    if key == "]" then
        HideLowerThirdFull()
    end

    if key == "[" then
        ShowLowerThirdFull()
    end


    if key == "\\" then
        HideBreakfastIntroClock()
    end

    if key == ";" then
        ShowBreakfastIntroClock()
    end

    if key == "8" then
        --HideProgramBadge()
        HideInfoBadge()
    end

    if key == "kp*" then
        ShowBG = not ShowBG
    end

    if key == "kp1" then
        ShowTickerOnly()
    end

    if key == "kp2" then
        HideTickerOnly()
    end

    if key == "9" then 
        ShowLowerThirdClock()
    end

    if key == "0" then 
        HideLowerThirdClock()
    end


    


end




--HideHeadlineSingle()
--HidePlaceName()

HideHeadlineInstant()
HidePlaceNameInstant()
HideLowerThirdFullInstant()
HideBreakfastIntroClockInstant()
HideLowerThirdClockInstant()
HideBadgesInstant()
--ShowLowerThirdFull()



