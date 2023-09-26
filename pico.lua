-- nebula nights pico 8 
-- property of oh. & fox

function _init()
    player = {
      x=63
      y=63
    }
    end

    -- array of stars
    local stars = {}
    
    -- number of stars
    local num_stars = 20
    
    -- initialize the stars with random positions
    for i=1, num_stars do
      local star = {}
      star.x = rnd(128) -- random x-coordinate from 0 to 128
      star.y = rnd(128) -- random y-coordinate from 0 to 128
      add(stars, star)
    end
    function _update()
      -- move each star to the left by 1 pixel
      for star in all(stars) do
        star.x = star.x - 1
        -- if the star goes off the screen to the left, reset its position to the right
        if star.x < 0 then
          star.x = 128
          star.y = rnd(128)
        end
      end
      -- player movement
      if btn() then
        player.x+=1 -- move right
    end
    if btn() then
        player.x-=1 -- move left
    end
    if btn() then
        player.y+=1 -- move down
    end
    if btn() then
        player.y-=1 -- move up
    end
    end

    function _draw()
      cls()
      -- draw each star
      for star in all(stars) do
        spr(001, star.x, star.y)
      end
      -- draw the player
        spr(002, player.x, player.y)
    end