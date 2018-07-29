import string
import random

COURSE    = "L2KN"
PASS_LENG = 8
userpasslist = []

for num in range(1, 501):
  padded = '%06d' % num
  id     = COURSE + padded
  userpasslist.append(id + ":" + ''.join([random.choice(string.ascii_letters + string.digits) for i in range(PASS_LENG)]))

with open("userpasslist.txt", "w", encoding="utf-8") as f:
    f.write("\n".join(userpasslist))

