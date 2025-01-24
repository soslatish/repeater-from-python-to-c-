a = 11
b = 20.55
c = 22
d = 2048
e = "stroka"
f = [1,2,3,4,5,6,7,8]
g = True

for i in range(5):
    a = a + 2
    b = b - 1.7
    c = c * 2
    d = d / 2

for i in range(10):
    g = not g
    if g:
        d = d + a
    else:
        d = d + c

for i in range(8):
    f[i] += i
    
while c > 32:
    c = c // 2
    
d = d % 23

if d != 12:
    d = 23
elif d == 11:
    d = 22222
else:
    d = 0
    
if a == 21:
    a = 43
    
c = a + c
a = c - a