local pd <const> = playdate
local gfx <const> = pd.graphics

import "paddle"

class('Player').extends(gfx.sprite)

function Player:init(x, y, speed)
    self:setImage(draw_paddle(10, 70))

    self:setCollideRect(0, 0, self:getSize())
    self:setGroups(paddle_coll_group)
    self:setCollidesWithGroups({bound_coll_group, puck_coll_group})
    self.speed = speed
    self:moveTo(x,y)
    self:add()
end

function Player:collisionResponse()
    return "bounce"
end

function Player:update()
    if pd.buttonIsPressed(pd.kButtonUp) then
        self:moveWithCollisions(self.x, self.y - self.speed)
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        self:moveWithCollisions(self.x, self.y + self.speed)
    end
end