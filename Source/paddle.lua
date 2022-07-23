local pd <const> = playdate
local gfx <const> = pd.graphics

function draw_paddle(size_x, size_y)
    local paddle_image = gfx.image.new(size_x, size_y)
    gfx.pushContext(paddle_image)
    gfx.fillRoundRect(0, 0, size_x, size_y, 10)
    gfx.popContext()
    return paddle_image
end