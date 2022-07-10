function compare(x, y)
  if x == y then
    return true
  elseif x == nil or y == nil then
    return false
  else
    for i in ipairs(x) do
      if x[i] ~= y[i] then
        return false
      end
    end
    return true
  end
end

function length(x)
  local l = 0
  for i in pairs(x) do
    l = l + 1
  end
  return l
end

function capitalize(x)
  return
    string.upper(string.sub(x, 1, 1)) ..
    string.lower(string.sub(x, 2, string.len(x)))
end


function galleryRandom()
  a = 1
  b = math.random(length(gallery))
  for x, i in pairs(gallery) do
    if a == math.floor(b) then
      return {i, x}
    end
    a = a + 1
  end
end

function loadPixels(x)
  if x == nil then
    if last ~= nil then
      while compare(choice, last) do
        choice = galleryRandom()
      end
    else
      choice = galleryRandom() -- ugly stupid code repetition
    end
    love.window.setTitle(capitalize(choice[2]))
    pixels = choice[1]
  else
    love.window.setTitle(capitalize(x))
    pixels = gallery[x]
  end
  columnsize = love.graphics.getWidth()
  rowsize = love.graphics.getHeight() / length(pixels)
  last = choice
end
