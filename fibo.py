def fib(n): # число Фибоначчи
    A = [0]*(n+1)
    A[0] = 0
    A[1] = 1
    for i in range(2, n+1):
        A[i] = A[i-1]+A[i-2]
    return A[n]
    
def fib_digit(n): # послодняя цифра
    a = 0
    b = 1
    c = 0
    for i in range(2, n+1):
        c = (a + b) % 10
        a = b
        b = c
    return c
    
