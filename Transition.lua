Transition = {
    PurplePart = {
        x = 0,
        y = 1080+500,
        w = 1920,
        h = 500,
    },

    WhitePart = {
        x = 0,
        y = 1080+1100,
        w = 1920,
        h = 1100,
    },
    col = ThemeColor
}

function DrawTransition()
    love.graphics.setColor(Transition.col[1],Transition.col[2],Transition.col[3],0.95)
    love.graphics.rectangle("fill",Transition.PurplePart.x,Transition.PurplePart.y,Transition.PurplePart.w,Transition.PurplePart.h)

    love.graphics.setColor(0.8,0.8,0.8,1)
    love.graphics.rectangle("fill",Transition.WhitePart.x,Transition.WhitePart.y,Transition.WhitePart.w,Transition.WhitePart.h)
end


function ShowTransition()
    if PurpleAnim then PurpleAnim:stop() end
    if WhiteAnim then WhiteAnim:stop() end

    Transition.PurplePart.y = 1080+500
    Transition.WhitePart.y = 1080+1100

    PurpleAnim = Anim.to(Transition.PurplePart,1.3,{y = -500})
    WhiteAnim = Anim.to(Transition.WhitePart,1.3,{y = -1100}):delay(0.1)
end