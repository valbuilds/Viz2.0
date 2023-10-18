local TTimer = require "timer"

DontRunTicker = false

TickerSequence = 
{
    --{mode = "Head", text = "bbc.co.uk/news", duration = 1},
    -- -- {mode = "BreakingHead", text = "BREAKING", duration = 3},
    -- -- {mode = "Breaking", text = "A man in connection to multiple murders in Stockton has been arrested", duration = 5},
    -- -- {mode = "Breaking", text = "Police arrested Wesley Brownlee, 43, of Stockton just before dawn this Sunday", duration = 5},
    -- {mode = "Head", text = "HEADLINES", duration = 2},
    -- {mode = "Normal", text = "Edit the text in VizHelper", duration = 5},
    

    -- --{mode = "Normal", text = "Ukraine war: Putin tells Russian soldiers' mothers he shares their pain", duration = 5},
    -- --{mode = "Normal", text = "Ukraine war: 6 million without power as winter bites", duration = 5},
    -- --{mode = "Normal", text = "World Cup: Iran protesters confronted at World Cup game against Wales", duration = 5},
    -- --{mode = "Normal", text = "Kanye West announces 2024 presidential bid", duration = 5},
    -- --{mode = 'Normal', text = "Emergencies Act: Trudeau defends use to end 'Freedom Convoy' protests", duration = 5},
    -- --{mode = 'Normal', text = "US Walmart shooting: Weapon purchased morning of attack", duration = 5},
    -- --{mode = 'Normal', text = "Ukraine war: Russia atrocities bring Nato members closer", duration = 5},
    -- --{mode = 'Normal', text = "Elon Musk says Twitter will offer 'amnesty' to suspended accounts", duration = 5},
    -- {mode = 'BlueHead', text = "INTERACTIVE", duration = 3},
    -- {mode = 'Normal', text = "Edit the text in VizHelper", duration = 5},
    -- --3,5

    --{mode = "BreakingHead", text = "BREAKING", duration = 3},
    --{mode = "Breaking", text = "Manchester united are rubbish", duration = 3},

    
}
TickerI = 0
TickerRunning = false

function ShowTickerText(text)
    --Set the text
    LowerThirdFull.TickerText.Text = text

    LowerThirdFull.TickerBlock.y = 1005 + 40
    LowerThirdFull.TickerText.y = 986 + 40

    LowerThirdFull.TickerBlock.col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],0}
    LowerThirdFull.TickerText.col = {0.2,0.2,0.2,0}


    --Move the ticker block up
    Anim.to(LowerThirdFull.TickerBlock, 0.8, {y = 1005}):ease("cubicout")

    --Move the ticker text up
    Anim.to(LowerThirdFull.TickerText, 0.8, {y = 986}):ease("cubicout")

    --Fade in the ticker text
    TTimer.tween(0.5, LowerThirdFull.TickerText, {col = {0.2,0.2,0.2,1}})

    --Fade in the ticker block
    TTimer.tween(0.5, LowerThirdFull.TickerBlock, {col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],1}})
end

function ShowTickerTextBreaking(text)
    --Set the text
    LowerThirdFull.TickerText.Text = text

    LowerThirdFull.TickerBlock.y = 1005 + 40
    LowerThirdFull.TickerText.y = 986 + 40

    LowerThirdFull.TickerBlock.col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],0}
    LowerThirdFull.TickerText.col = {0.2,0.2,0.2,0}


    --Move the ticker block up
    Anim.to(LowerThirdFull.TickerBlock, 0.8, {y = 1005}):ease("cubicout")

    --Move the ticker text up
    Anim.to(LowerThirdFull.TickerText, 0.8, {y = 986}):ease("cubicout")

    --Fade in the ticker text
    TTimer.tween(0.5, LowerThirdFull.TickerText, {col = {0.7,0,0,1}})

    --Fade in the ticker block
    TTimer.tween(0.5, LowerThirdFull.TickerBlock, {col = {0.7,0,0,1}})
end

function ShowTickerTextBlue(text)
    --Set the text
    LowerThirdFull.TickerText.Text = text

    LowerThirdFull.TickerBlock.y = 1005 + 40
    LowerThirdFull.TickerText.y = 986 + 40

    LowerThirdFull.TickerBlock.col = {27/255, 78/255, 94/255,0}
    LowerThirdFull.TickerText.col = {0.2,0.2,0.2,0}


    --Move the ticker block up
    Anim.to(LowerThirdFull.TickerBlock, 0.8, {y = 1005}):ease("cubicout")

    --Move the ticker text up
    Anim.to(LowerThirdFull.TickerText, 0.8, {y = 986}):ease("cubicout")

    --Fade in the ticker text
    TTimer.tween(0.5, LowerThirdFull.TickerText, {col = {0.2,0.2,0.2,1}})

    --Fade in the ticker block
    TTimer.tween(0.5, LowerThirdFull.TickerBlock, {col = {27/255, 78/255, 94/255,1}})
end

function RollTickerTextOut()
    LowerThirdFull.TickerScissor = true

    --Move the ticker block up
    Anim.to(LowerThirdFull.TickerBlock, 0.5, {y = 970}):ease("cubicin")

    --Move the ticker text up
    Anim.to(LowerThirdFull.TickerText, 0.5, {y = 940}):ease("cubicin")

    TTimer.after(0.7, function()
        StartTicker()
    end)
end

function RollTickerTextIn(text)
    LowerThirdFull.TickerScissor = true

    LowerThirdFull.TickerText.Text = text

    LowerThirdFull.TickerBlock.y = 1005 + 40
    LowerThirdFull.TickerText.y = 986 + 40

    --Move the ticker block up
    Anim.to(LowerThirdFull.TickerBlock, 0.5, {y = 1005}):ease("cubicout")

    --Move the ticker text up
    Anim.to(LowerThirdFull.TickerText, 0.5, {y = 986}):ease("cubicout")

    TTimer.after(TickerSequence[TickerI].duration, function()
        RollTickerTextOut()
    end)

    --TTimer.after(TickerSequence[TickerI].duration+0.9, function()
    --    StartTicker()
    --end)
end

function RollTickerTextInBreaking(text, atTheEnd)
    LowerThirdFull.TickerScissor = true

    LowerThirdFull.TickerText.Text = text

    
    LowerThirdFull.TickerText.y = 986 + 40


    --Move the ticker text up
    Anim.to(LowerThirdFull.TickerText, 0.5, {y = 986}):ease("cubicout")

    TTimer.after(TickerSequence[TickerI].duration, function()
        if atTheEnd == true then 
            RollTickerTextOut()
        else 
            RollTickerTextOutBreaking()
        end
    end)

    --TTimer.after(TickerSequence[TickerI].duration+0.9, function()
    --    StartTicker()
    --end)
end

function RollTickerTextOutBreaking(text)
    LowerThirdFull.TickerScissor = true

    --Move the ticker text up
    Anim.to(LowerThirdFull.TickerText, 0.5, {y = 940}):ease("cubicin")

    TTimer.after(0.7, function()
        StartTicker()
    end)
end




function StartTicker()
    TickerRunning = true
    TickerI = TickerI + 1
    if TickerI > #TickerSequence then
        --StopTicker()
        TickerI = 1
        TTimer.after(0.5, function()
            StartTicker()
        end)
        return
    end

    if TickerSequence[TickerI].mode == "Head" then
        --Set tickerblock to normal color
        LowerThirdFull.TickerBlock.col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],1}


        LowerThirdFull.TickerScissor = false
        --Show the ticker text
        ShowTickerText(TickerSequence[TickerI].text)

        --Wait the duration
        if DontRunTicker == true then TickerRunning = false return end
        TTimer.after(TickerSequence[TickerI].duration, function()
            RollTickerTextOut()
        end)

    elseif TickerSequence[TickerI].mode == "BlueHead" then
        LowerThirdFull.TickerScissor = false
        --Show the ticker text
        ShowTickerTextBlue(TickerSequence[TickerI].text)

        --Wait the duration
        TTimer.after(TickerSequence[TickerI].duration, function()
            RollTickerTextOut()
        end)
    elseif TickerSequence[TickerI].mode == "Normal" then
        RollTickerTextIn(TickerSequence[TickerI].text)
    elseif TickerSequence[TickerI].mode == "BreakingHead" then
        LowerThirdFull.TickerScissor = false
        TTimer.clear()
        ShowTickerTextBreaking("BREAKING")
        FlashTickerText()
        TTimer.after(TickerSequence[TickerI].duration, function()
            RollTickerTextOutBreaking()
        end)
    elseif TickerSequence[TickerI].mode == "Breaking" then
        LowerThirdFull.TickerScissor = true
        local rollOutFull = false
        if #TickerSequence == TickerI then
            rollOutFull = true
        end
        RollTickerTextInBreaking(TickerSequence[TickerI].text, rollOutFull)
        FlashTickerBlock()
    end
end 

function KillTicker(text)
    DontRunTicker = true

    if TickerRunning == false then return end

    StopTicker()
    Timer.after(0.5, function()
            --Set tickerblock to normal color
            LowerThirdFull.TickerBlock.col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],1}
    
    
            LowerThirdFull.TickerScissor = false
            --Show the ticker text
            ShowTickerText(text)
    

    end)
end

function ResumeTicker()
    if TickerRunning == true then return end
    if LowerThirdFull.LowerThirdShowing == false then return end

    DontRunTicker = false

    TickerI = 1

    Timer.after(1, function()
        StartTicker()
    end)
end

function StopTicker()
    LowerThirdFull.TickerScissor = true
    TTimer.clear()
    TickerRunning = false

    --RollTickerTextOut()

    --TTimer.clear()

    --Fade out the ticker text
    TTimer.tween(0.3, LowerThirdFull.TickerText, {col = {0.2,0.2,0.2,0}})
    --Fade out the ticker block
    TTimer.tween(0.3, LowerThirdFull.TickerBlock, {col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],0}})
end

function FlashTickerBlock()
    TTimer.after(0.4, function()
        TTimer.tween(0.1, LowerThirdFull.TickerBlock, {col = {0.7,0,0,0}})
    end)
    TTimer.after(0.6, function()
        TTimer.tween(0.1, LowerThirdFull.TickerBlock, {col = {0.7,0,0,1}})
    end)
    TTimer.after(0.8, function()
        TTimer.tween(0.1, LowerThirdFull.TickerBlock, {col = {0.7,0,0,0}})
    end)
    TTimer.after(1.0, function()
        TTimer.tween(0.1, LowerThirdFull.TickerBlock, {col = {0.7,0,0,1}})
    end)
    TTimer.after(1.2, function()
        TTimer.tween(0.1, LowerThirdFull.TickerBlock, {col = {0.7,0,0,0}})
    end)
    TTimer.after(1.4, function()
        TTimer.tween(0.1, LowerThirdFull.TickerBlock, {col = {0.7,0,0,1}})
    end)
end

function FlashTickerText()
    TTimer.after(0.6, function()
        TTimer.tween(0.1, LowerThirdFull.TickerText, {col = {0.7,0,0,0}})
    end)
    TTimer.after(0.8, function()
        TTimer.tween(0.1, LowerThirdFull.TickerText, {col = {0.7,0,0,1}})
    end)
    TTimer.after(1.0, function()
        TTimer.tween(0.1, LowerThirdFull.TickerText, {col = {0.7,0,0,0}})
    end)
    TTimer.after(1.2, function()
        TTimer.tween(0.1, LowerThirdFull.TickerText, {col = {0.7,0,0,1}})
    end)
    TTimer.after(1.4, function()
        TTimer.tween(0.1, LowerThirdFull.TickerText, {col = {0.7,0,0,0}})
    end)
    TTimer.after(1.6, function()
        TTimer.tween(0.1, LowerThirdFull.TickerText, {col = {0.7,0,0,1}})
    end)
end