

def primfacs(n):
    i = 2
    primfac = []
    while i * i <= n:
        while n % i == 0:
            primfac.append(i)
            n = n / i
        i = i + 1
    if n > 1:
        primfac.append(n)
    return primfac


def nodnokreverse(a, b):
    if (a < b):
        if (b%a != 0):
            print(0)
        else:
            c = set(primfacs(b//a))
            c = len(c)
            print(2**(c))
    elif (a == b):
        print(1)
    else:
        print(0)

a, b = map(int, input().split())

nodnokreverse(a,b)
