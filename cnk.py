def fact(k):
    A = 1
    for i in range(1, k+1):
        A*=i
    return A

def cnk(n, k):
    return(fact(n)/(fact(n-k)*fact(k)))

for i in range(21):
    print(cnk(20, i)
