local VideoChannel = nil
local AudioChannel = nil
local HeadlineBed = nil
local AudioVol = {vol = 1, HeadlineVol = 1}
local clipName = ""
local alpha = {a = 0}
local FreezeFrame = false
AVPlayoutEnabled = false

local AVTimer = Timer.new()

if love.filesystem.getInfo("GenericPack_Viz2.0/") ~= nil then
    AVPlayoutEnabled = true
    HeadlineBed = love.audio.newSource("GenericPack_Viz2.0/Audio/Headlines.wav", "static")    
end



function UpdateAVplayout(dt)
    if AVPlayoutEnabled == false then return end
    AVTimer:update(dt)
    if AudioChannel ~= nil then
        AudioChannel:setVolume(AudioVol.vol)
    end

    HeadlineBed:setVolume(AudioVol.HeadlineVol)
end

function DrawAVplayout()
    if AVPlayoutEnabled == false then return end
    if VideoChannel ~= nil then
        love.graphics.setColor(1,1,1,alpha.a)
        love.graphics.draw(VideoChannel,0,0)
    end
end

function LoadAVPlayout(vidpath, audpath, freeze)
    if AVPlayoutEnabled == false then return end
    FreezeFrame = freeze
    AudioVol.vol = 0

    AVTimer:clear()
    if VideoChannel ~= nil then
        VideoChannel:release()
        VideoChannel = nil
        collectgarbage()
    end

    if AudioChannel ~= nil then
        AudioChannel:stop()
        AudioChannel:release()
        AudioChannel = nil
        collectgarbage()
    end

    VideoChannel = love.graphics.newVideo("GenericPack_Viz2.0/"..vidpath)
    AudioChannel = love.audio.newSource("GenericPack_Viz2.0/Audio/"..audpath, "static")
    clipName = vidpath
    if freeze then
        alpha.a = 1
        VideoChannel:play()

        if clipName == "WN_Close.ogv" then
            ShowTitleLogoInstant()
        end

        AVTimer:after(0.1, function()
            VideoChannel:pause()
        end)
    else 
        alpha.a = 0
    end
end

function PlayAV()
    if AVPlayoutEnabled == false then return end
    if VideoChannel ~= nil then
        VideoChannel:play()
        if FreezeFrame == false then
            --Fade up audio
            AVTimer:tween(1, AudioVol, {vol = 1}, "linear")
        else
            --Cut audio in
            AudioVol.vol = 1
        end

        if clipName == "WN_Close.ogv" then
            ShowTitleLogoInstant()
        elseif clipName == "WN_Titles.ogv" then
            AVTimer:tween(0.5, alpha, {a = 1})
            AVTimer:after(10.3, function()
                ShowTitleLogo()
            end)
            AVTimer:after(12.5, function()
                AVTimer:tween(0.4, alpha, {a = 0})
                AVTimer:tween(7, AudioVol, {vol = 0}, "linear", function()
                    AudioChannel:stop()
                    AudioChannel:release()
                    AudioChannel = nil
                    collectgarbage()
                end)
            end)
            
        elseif clipName == "NC_Titles.ogv" or clipName == "ONE_Titles1E.ogv" or clipName == "ONE_Titles6E.ogv"or clipName == "ONE_Titles10E.ogv" then
            AVTimer:tween(0.5, alpha, {a = 1})
            AVTimer:after(6, function()
                ShowTitleLogo()
            end)
            AVTimer:after(7.5, function()
                AVTimer:tween(0.3, alpha, {a = 0})
                AVTimer:after(8, function()
                    AVTimer:tween(7, AudioVol, {vol = 0}, "linear", function()
                        AudioChannel:stop()
                        AudioChannel:release()
                        AudioChannel = nil
                        collectgarbage()
                    end)
                end)
            end)
        end



    end
    if AudioChannel ~= nil then
        AudioChannel:play()
    end
end

function SetHeadlineBong(audiopath)
    if AVPlayoutEnabled == false then return end
    HeadlineBed:stop()
    HeadlineBed:release()
    HeadlineBed = nil
    collectgarbage()

    HeadlineBed = love.audio.newSource("GenericPack_Viz2.0/Audio/"..audiopath, "static")
end

function PlayHeadlineBong()
    if AVPlayoutEnabled == false then return end
    AudioVol.HeadlineVol = 1
    HeadlineBed:seek(0)
    HeadlineBed:play()
end

function StopHeadlineBong()
    if AVPlayoutEnabled == false then return end
    HeadlineBed:stop()
end

function FadeOutHeadlineBong()
    if AVPlayoutEnabled == false then return end
    AVTimer:tween(1, AudioVol, {HeadlineVol = 0}, "linear", function()
        HeadlineBed:stop()
    end)
end