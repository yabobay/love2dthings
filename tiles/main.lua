dofile("pixels.lua")
dofile("utility.lua")

function love.load()

  love.window.setMode(500, 500)
  loadPixels()
  party = false

end

function love.draw()
  for i, x in pairs(pixels) do
    pixelsize = columnsize / length(pixels[i])
    for j, y in pairs(x) do
      if y ~= 0 then -- white pixel
        if party then
          love.graphics.setColor (math.random(), math.random(), math.random())
        else
          love.graphics.setColor (1,1,1)
        end
      else -- black pixel
        if party then
          love.graphics.setColor (math.random() / 10 , math.random() / 10, math.random() / 10)
        else
          love.graphics.setColor(0,0,0)
        end
      end
      love.graphics.rectangle (
        "fill", pixelsize*(j-1), rowsize*(i-1), pixelsize, rowsize
      )
    end
  end
end

function love.keypressed(key, code, rep)
  if key == "space" then
    -- loads a sprite at random
    loadPixels()
  elseif key == "p" then
    -- switches on or off party mode
    if party then
      party = false
    else
      party = true
    end
  end
end
