# not not not perfect!

import png
from sys import argv as args

# converts a python list to a lua table constructor
def list2table(lis):
  table = "{"
  for i in range(len(lis)):
    if type(lis[i]) == list:
      table += list2table(lis[i]) # recursive woooooooooo
    else:
      table += str(lis[i])
    if i != len(lis)-1:
      table += ','
  table += "}"
  return table

if len(args) > 1:
  r = png.Reader(file=open(args[1], 'rb'))
  readed = r.read()

  image = [] # list that represents all the pixels in the image
  rows = list(readed[2])

  for x in range(len(rows)): # for every row
    image.append([])
    for i in range(0, len(rows[x]), 3): # for every pixel
      image[x].append([])
      for j in range(3):
        col = rows[x][i+j]/255
        if col == int(col):
          col = int(col)
        image[x][len(image[x])-1].append(col)

  print(list2table(image))
