local pd <const> = playdate
local gfx <const> = pd.graphics

function draw_bounds(x1, y1, x2, y2)
    local top_bound = draw_90_deg_line_collider(x1, x2, 0, 5)
    top_bound:moveTo(center_point(x1, x2), y1)
    top_bound:setGroups(bound_coll_group)
    top_bound:setCollidesWithGroups({ paddle_coll_group, puck_coll_group })
    top_bound.collisionResponse = function (self)
        return "bounce"
    end

    local bottom_bound = draw_90_deg_line_collider(x1, x2, 0, 5)
    bottom_bound:moveTo(center_point(x1, x2), y2)
    bottom_bound:setGroups(bound_coll_group)
    bottom_bound:setCollidesWithGroups({ paddle_coll_group, puck_coll_group })
    top_bound.collisionResponse = function (self)
        return "bounce"
    end

    local left_bound = draw_90_deg_line_collider(y1, y2, 5, 0)
    left_bound:moveTo(x1, center_point(y1, y2))
    left_bound:setGroups(bound_coll_group)
    left_bound:setCollidesWithGroups({ paddle_coll_group, puck_coll_group })
    top_bound.collisionResponse = function (self)
        return "bounce"
    end

    local right_bound = draw_90_deg_line_collider(y1, y2, 5, 0)
    right_bound:moveTo(x2, center_point(y1, y2))
    right_bound:setGroups(bound_coll_group)
    right_bound:setCollidesWithGroups({ paddle_coll_group, puck_coll_group })
    top_bound.collisionResponse = function (self)
        return "bounce"
    end
end