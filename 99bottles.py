'''
## 99 Bottles of beer on the wall 
## justin e 
'''

import time
#bottles = 99

def bottles(bottles = 99):
    while bottles > 0:
        if bottles == 1:
            print(bottles," bottle of beer on the wall!")
            print(bottles," bottle of beer!")
        else:
            print(bottles," bottles of beer on the wall!")
            print(bottles," bottles of beer!")
        print("Take one down, pass it around!")
        bottles -= 1

        #time.sleep(bottles)
        if bottles ==1:
            print(bottles," bottle of beer on the wall!")

        elif bottles == 0:
            print("No more bottles of beer on the wall..?! Nooooooooooooooooo!")
        else:
            print(bottles,"bottles of beer on the wall")
 
print(bottles())
