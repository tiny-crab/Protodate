import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"
import "utils"
import "bounds"
import "puck"

local pd <const> = playdate
local gfx <const> = pd.graphics
bound_coll_group = 1
paddle_coll_group = 2
puck_coll_group = 3

Player(375, 120, 4)
draw_bounds(0, 0, 400, 240)
Puck(200, 120, 5)

function pd.update()
    gfx.sprite.update()
end