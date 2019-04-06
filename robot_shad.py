# робот с шада
n = int(input())

x = 'x'
y = 'y'

current = {'x': 0, 'y': 0}
a = 1



while True:
    if n == 0: break
    for i in range(a):
        current[y]+=1
        n-=1
        if n == 0: break

    if n == 0: break
    for i in range(a):
        current[x] += 1
        n -= 1
        if n == 0: break

    a+=1
    if n == 0: break
    for i in range(a):
        current[y] -= 1
        n -= 1
        if n == 0: break

    if n == 0: break
    for i in range(a):
        current[x] -= 1
        n -= 1
        if n == 0: break
    a += 1

print(current[x], ' ', current[y], sep='')
