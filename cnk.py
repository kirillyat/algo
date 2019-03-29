def fact(k):
    A = 1
    for i in range(1, k+1):
        A*=i
    return A

def cnk(n, k):
    return(fact(n)/(fact(n-k)*fact(k)))

def isPrime(a):
    return not ( a < 2 or any(a % i == 0 for i in range(2, int(a ** 0.5) + 1)))

def phi(n):
    y = n
    for i in range(2,n+1):
        if isPrime(i) and n % i == 0:
            y *= 1 - 1.0/i
    return int(y)

k, n = map(int, input().split())
print(int(phi(int(fact(n)/fa
                  
