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
      if y ~= 0 then
        love.graphics.rectangle (
          "fill", pixelsize*(j-1), rowsize*(i-1), pixelsize, rowsize
        )
        if party then
          love.graphics.setColor (
            math.random(), math.random(), math.random()
          )
        end
      end
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
      love.graphics.setColor(1,1,1) -- set color back to white
    else
      party = true
    end
  end
end
