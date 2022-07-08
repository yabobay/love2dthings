dofile("utility.lua")

gallery = {
  creeper = {
    {0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0},
    {0,1,1,0,0,1,1,0},
    {0,1,1,0,0,1,1,0},
    {0,0,0,1,1,0,0,0},
    {0,0,1,1,1,1,0,0},
    {0,0,1,1,1,1,0,0},
    {0,0,1,0,0,1,0,0}
  },
  mario = {
    {0,0,0,0,0,1,1,1,1,1,0,0,0,0,0},
    {0,0,0,0,1,0,0,0,0,0,1,1,1,0,0},
    {0,0,0,1,0,0,0,0,0,0,0,0,0,1,0},
    {0,0,0,1,1,1,0,0,1,0,1,1,1,0,0},
    {0,0,1,0,0,1,1,0,1,0,0,0,0,1,0},
    {0,0,1,0,0,1,1,0,0,1,0,0,0,1,0},
    {0,0,0,1,1,0,0,0,1,1,1,1,1,0,0},
    {0,0,0,1,1,1,0,0,0,0,0,1,0,0,0},
    {0,1,1,0,0,0,1,1,0,0,1,1,1,0,0},
    {1,0,0,0,0,0,0,1,1,0,0,1,0,1,0},
    {1,0,0,0,0,0,1,1,1,1,1,1,0,0,1},
    {0,1,0,0,1,1,1,1,0,1,1,0,1,0,1},
    {0,0,1,1,1,1,1,1,1,1,1,0,0,1,0},
    {0,1,0,0,1,1,1,1,1,1,0,0,0,1,0},
    {0,1,0,0,0,1,0,0,1,0,0,0,1,0,0},
    {0,0,1,1,1,0,0,0,0,1,1,1,0,0,0},
  }
}

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
  if not x then
    while compareTables(choice, last) do
      choice = galleryRandom()
    end
  else
    choice = gallery[x]
  end
  pixels = choice[1]
  love.window.setTitle(choice[2])
  columnsize = love.graphics.getWidth()
  rowsize = love.graphics.getHeight() / length(pixels)
  last = choice
end
