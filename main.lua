
--[[
    MADE BY PLAYSAMAY4 (Discord: playsamay4#3646)
    DO NOT REDISTRIBUTE WITHOUT PERMISSION

    Viz2.0
]]


Anim = require "flux"
Timer = require "timer"
inspect = require "inspect"
push = require "push"
local sock = require "sock"
local ShowBG = false
KeepTopText = ""
KeepBottomText = ""
EnableBadge = false
shouldUsePush = false

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

require "ShitHeadlines"

waterMark = true
waterMarkFade = {a = 1}
local waterMarkFont = love.graphics.newFont("fonts/ReithSansMd.ttf",40)

function love.load()
    bg = love.graphics.newImage("backdrop.png")

    Fader = love.graphics.newImage("HeadlineFade.png")

    BBCSmall = love.graphics.newImage("WhiteLogoTransparent.png")

    ReithSerif = love.graphics.newFont("fonts/ReithSerifRg.ttf",130)
    ReithSansBold = love.graphics.newFont("fonts/ReithSansBd.ttf",30)
    ReithSansRegular = love.graphics.newFont("fonts/ReithSansRg.ttf",30)
    ReithSansMedium = love.graphics.newFont("fonts/ReithSansMd.ttf",30)

    TickerFont = love.graphics.newFont("fonts/ReithSansMd.ttf",32)
    TickerFontBold = love.graphics.newFont("fonts/ReithSansBd.ttf",32)
    PresenterName = love.graphics.newFont("fonts/ReithSerifMd.ttf",56)

    Splash = love.graphics.newImage("splash.png")

    tcpThread = love.thread.newThread("tcp.lua")
    tcpThread:start()

    if shouldUsePush == true then
        local gameWidth, gameHeight = 1920,1080 --fixed game resolution
        local windowWidth, windowHeight = 1280,720

        push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {resizable = true,canvas = true, fullscreen = false})
    end
   

end


function love.update(dt)
    if love.thread.getChannel("tcpThreadData"):getCount() > 0 then
        local data = love.thread.getChannel("tcpThreadData"):pop()
        if data == "Connect" then
            Timer.tween(0.8, waterMarkFade, {a = 0}, "in-out-cubic", function()
                waterMark = false
            end)
        end

        request(data)

    end


    Anim.update(dt)
    Timer.update(dt)
    server:update()

    UpdateBreakfastIntroClock()
    UpdateLowerThirdClock()
    UpdateAVplayout(dt)
end


function love.draw()
    
    if shouldUsePush == true then push:start() end
    love.graphics.setBackgroundColor(0,0,0,0)
    
    if ShowBG then 
        love.graphics.setColor(1,1,1,0.6)
        love.graphics.draw(bg,0,0,0,2,2)
        -- love.graphics.draw(bg,0,0)
    end

    DrawAVplayout()

    DrawShitHeadlines()


    DrawTransition()

    DrawFlash()

    DrawLowerThirdFull()

    DrawPlaceName()

    DrawTitleLogo()

    DrawBreakfastIntroClock()

    DrawLowerThirdClock()

    if Single then DrawHeadlineSingle() else DrawHeadlineDouble() end

    
    



    if waterMark == true then
        love.graphics.setColor(1,1,1,waterMarkFade.a)
        love.graphics.draw(Splash)
        love.graphics.setColor(1,1,1,waterMarkFade.a)
        love.graphics.setFont(waterMarkFont)
        love.graphics.print("Made by playsamay4\n\nhttps://github.com/playsamay4/Viz2.0\n\nWaiting for connection from VizHelper...", 100, 700)
        love.graphics.print("Viz2.0", 1750,1000)
        
    end
    
    if shouldUsePush == true then push:finish() end
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

    if key == "k" then 
        ShowLowerThirdText("Lorem ipsum dolor sit amet", {"blah blah blah fhdoiha98h489vm948yn58 ", "manchester united are rubbish"})
    end

    if key == "l" then 
        HideLowerThirdText()
    end

    if key == "h" then
        LowerThirdFull.PresenterName.Text = "playsamay4"
        ShowPresenterName()
    end

    if key == "j" then
        HidePresenterName()
    end

    if key == "n" then

    end

    if key == "d" then
        ShowLowerThirdTextSolo("Lorem ipsum dolor sit amet", {"blah blah blah fhdoiha98h489vm948yn58 ", "manchester united are rubbish"})
    end
    
    if key == "f" then
        HideLowerThirdTextSolo()
    end

    if key == "q" then
        ShowShitHeadlines("Tortured and skinned alive!", "LookNorth")
    end

    
    if key == "a" then
        HideShitHeadlines()
    end

    if key == "s" then
       RemoveShitHeadline()
    end


    if key == "=" then
        ShowChameleon()
    end

    if key == "-" then
        HideChameleon()
    end

    if key == "z" then
        Timer.tween(0.8, waterMarkFade, {a = 0}, "in-out-cubic", function()
            waterMark = false
        end)
    end

    -- if key == "]" then
    --     ShitHeadlines.lookN.HeadBox.h = ShitHeadlines.lookN.HeadBox.h + 1
    -- end

    -- if key == "[" then
    --     ShitHeadlines.lookN.HeadBox.h = ShitHeadlines.lookN.HeadBox.h - 1
    -- end

    -- if key == ";" then
    --     ShitHeadlines.lookN.HeadBox.y = ShitHeadlines.lookN.HeadBox.y + 1
    -- end

    -- if key == "\'" then
    --     ShitHeadlines.lookN.HeadBox.y = ShitHeadlines.lookN.HeadBox.y - 1
    -- end

    -- if key == "," then
    --     ShitHeadlines.lookN.HeadBox.x = ShitHeadlines.lookN.HeadBox.x - 1
    -- end

    -- if key == "." then
    --     ShitHeadlines.lookN.HeadBox.x = ShitHeadlines.lookN.HeadBox.x + 1
    -- end
end

function love.resize(w,h)
    push:resize(w, h)
end



--HideHeadlineSingle()
--HidePlaceName()

-- HideHeadlineInstant()
-- HidePlaceNameInstant()
-- HideLowerThirdFullInstant()
-- HideBreakfastIntroClockInstant()
-- HideLowerThirdClockInstant()
-- HideBadgesInstant()
-- HideChameleonInstant()
--ShowLowerThirdFull()



