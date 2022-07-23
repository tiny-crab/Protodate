local pd <const> = playdate
local gfx <const> = pd.graphics

function center_point(x1, x2)
    return (x1 + (x2 - x1) / 2)
end

function draw_90_deg_line_collider(p1, p2, x_width, y_width)
    local image = nil
    if (x_width > 0) then
        image = gfx.image.new(x_width, p2-p1)
        gfx.pushContext(image)
        gfx.fillRect(0, 0, x_width, p2-p1)
        gfx.popContext()
    elseif (y_width > 0) then
        image = gfx.image.new(p2-p1, y_width)
        gfx.pushContext(image)
        gfx.fillRect(0, 0, p2-p1, y_width)
        gfx.popContext()
    else
        print("Attempted to draw a line without a x_width or y_width specified")
        return
    end
    local sprite = gfx.sprite.new(image)
    sprite:setCollideRect(0, 0, sprite:getSize())
    sprite:add()
    return sprite
end