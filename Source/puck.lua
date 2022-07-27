local pd <const> = playdate
local gfx <const> = pd.graphics
local geo <const> = pd.geometry

class('Puck').extends(gfx.sprite)

function Puck:init(x, y, speed)
    local image = gfx.image.new(10, 10)
    gfx.pushContext(image)
        gfx.fillCircleInRect(0, 0, image:getSize())
    gfx.popContext()
    self:setImage(image)
    self:setCollideRect(0, 0, self:getSize())
    self:setGroups(puck_coll_group)
    self:setCollidesWithGroups({bound_coll_group, paddle_coll_group})
    self:add()
    self:moveTo(x,y)

    self.speed = speed

    -- determines where to "serve" the puck
    math.randomseed(pd.getSecondsSinceEpoch())
    local angle = math.random(0, 360)
    local v_x = math.sin(math.rad(angle))
    local v_y = math.cos(math.rad(angle))
    self.velocity = geo.vector2D.new(v_x, v_y):normalized()
end

function Puck:collisionResponse()
    return "bounce"
end

function Puck:update()
    local next_x = self.x + (self.velocity.x * self.speed)
    local next_y = self.y + (self.velocity.y * self.speed)
    local actual_x, actual_y, collisions, length = self:moveWithCollisions(next_x, next_y)
    if length > 0 then
        for index, collision in ipairs(collisions) do
            if collisions[index].normal.x ~= 0 then
                self.velocity.x = self.velocity.x * -1
            end
            if collisions[index].normal.y ~= 0 then
                self.velocity.y = self.velocity.y * -1
            end
        end
    end
end