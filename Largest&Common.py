'''
Выведите единственное число x, наибольшее из чисел, которое встречается в a максимальное количество раз.

Print the single number x, the largest of the numbers that occurs a maximum number of times.
'''

n = int(input())
D = {}
maxIndex = -1
maxElem = -1

for i in map(int, input().split()):
    D[i] = D.get(i, 0)+1



for i in D.keys():
    if maxIndex < D[i]:
        maxIndex = D[i]
        maxElem = i
    if maxIndex == D[i]:
        if maxElem < i:
            maxElem = i

print(maxElem)
