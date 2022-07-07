function length(x)
  local l = 0
  for i in ipairs(x) do
    l = l + 1
  end
  return l
end

function love.load()

  dofile("pixels.lua")
  pixels = gallery["creeper"]

  love.window.setMode(500, 500)
  columnsize = love.graphics.getWidth()
  rowsize = love.graphics.getHeight() / length(pixels)

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
  -- switches on or off party mode
  if key == "p" then
    if party then
      party = false
    else
      party = true
    end
  end
end
