local FlashVal = {
    col = {1,1,1,0},
}


function DrawFlash()
    love.graphics.setColor(FlashVal.col)
    love.graphics.rectangle("fill",0,0,1920,1080)
end

function Flash() 
    Anim.to(FlashVal.col, 0.2, {1,1,1,1}):oncomplete( function()
        Anim.to(FlashVal.col, 0.2, {1,1,1,0})
    end)
end