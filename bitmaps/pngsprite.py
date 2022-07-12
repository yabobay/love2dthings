# not not not perfect!

import png

def list2table(bmap):
  print("{")
  for x in range(0, len(bmap)): # for every line
    print("  {", end='')
    for y in range(0, len(bmap[x])): # for every pixel
      print("{", end='')
      for z in range(0, len(bmap[x][y])): # for each color in the pixel
        if z != len(bmap[x][y]) -1:
          print(bmap[x][y][z], end=',')
        else:
          print(bmap[x][y][z], end='')
      if y != len(bmap[x]) - 1:
        print("}", end=',')
      else:
        print("}", end='')
    if x != len(bmap) - 1:
      print("},")
    else:
      print("}")
  print("}")

r = png.Reader(file=open("bee2.png", 'rb'))

readed = r.read()

image = []
rows = list(readed[2])

for x in range(len(rows)): # for every row in the image
  image.append([])
  for i in range(0, len(rows[x]), 3): # for every pixel in the image
    image[x].append([])
    for j in range(3):
      col = rows[x][i+j]/255
      if col == int(col):
        col = int(col)
      image[x][len(image[x])-1].append(col)

list2table(image)
