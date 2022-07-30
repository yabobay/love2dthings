dofile "pixels.lua"
dofile "utility.lua"

function love.load()
  love.window.setMode(500, 500)
  loadPixels() -- load one bitmap at random from the ones we have
  party = false -- PARTY MODE!!
end

function love.draw()
  if not searching then
    for i, x in pairs(pixels) do
      pixelsize = columnsize / length(pixels[i])
      for j, y in pairs(x) do
        -- choose what color the pixel is
        if party then
          if y == 0 then
            love.graphics.setColor (math.random() / 10 , math.random() / 10, math.random() / 10)
          else
            love.graphics.setColor (math.random(), math.random(), math.random())
          end
        else
          if y == 0 then
            love.graphics.setColor (0,0,0)
          elseif type(y) == "table" then
            love.graphics.setColor (y[1], y[2], y[3])
          else
            love.graphics.setColor (1,1,1)
          end
        end
        -- actually draw the pixel
        love.graphics.rectangle (
          "fill", pixelsize*(j-1), rowsize*(i-1), pixelsize, rowsize
        )
      end
    end
  else -- if searching
    love.graphics.setColor(1,1,1)
    love.graphics.print("Load sprite:", 10, 10)
    love.graphics.print(search .. "|", 10, 50)
  end
end

function love.keypressed(key, code, rep)
  if not searching then
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
    elseif key == "/" then
      searching = true
      search = ""
    end
  else -- if searching
    if key == "backspace" then -- make backspace be backspace
      search = string.sub(search, 1, string.len(search) - 1)
    elseif key == "escape" then
      searching = false
    elseif key == "return" then
      -- if user says quit then quit
      if string.lower(search) == "quit" then
        love.event.quit()
      --[[
        if there is a bitmap with the name asked by the user, then
        load it. otherwise, tell them they're stupid.
      --]]
      elseif gallery[string.lower(search)] then
        loadPixels(string.lower(search))
      else
        loadPixels("eror_sprite_not_found", EROR)
      end
      searching = false -- we're done searching
    end
  end
end

function love.textinput(t)
  if searching then
    search = search .. t
  end
end

function love.update()
  if search == "/" then search = "" end -- quick shitty fix
end
