# function
def doSomething():
    print("function code is indented")


# reading all lines of a file 
filename = 'siddhartha.txt'
with open(filename) as f_obj:
    lines = f_obj.readlines()
    
for line in lines:
    print(line.rstrip())

# Read File Python One-Liner
list = [line.strip() for line in open(filename)]

# Factorial Python One-Liner
reduce(lambda x, y: x * y, range(1, n+1))

# Performance Profiling Python One-Liner
python -m cProfile foo.py

# Superset Python One-Liner
lambda l: reduce(lambda z, x: z + [y + [x] for y in z], l, [[]])

# Fibonacci Python One-Liner
lambda x: x if x<=1 else fib(x-1) + fib(x-2)

# Quicksort Python One-liner
lambda L: [] if L==[] else qsort([x for x in L[1:] if x< L[0]]) + L[0:1] + qsort([x for x in L[1:] if x>=L[0]])

# Sieve of Eratosthenes Python One-liner
reduce( (lambda r,x: r-set(range(x**2,n,x)) if (x in r) else r), range(2,int(n**0.5)), set(range(2,n)))

# find all indices of an element in a list
lst = [1, 2, 3, 'Alice', 'Alice']
indices = [i for i in range(len(lst)) if lst[i]=='Alice']

# list comprehension
list_comprehension = [values/function_outputs for input in input_list if condition]
my_List=[x for x in range(-3,3) if x>0]

# enumerate
list(enumerate(fruits, start=1))
# output would be = [(1, 'Apple'), (2, 'Banana'), (3, 'Mango'), (4, 'Watermelon')]

# map function applys function to each item
map(function_to_apply, list_of_inputs)

# lambda
# lambda arguments : expression
lambda x,y : x+y
lambda x: x**2

# filter, returns elements that match true
filter(function, input_list)

# reduce calcs a value, function applies cumulatively from left to right
# takes two arguments at a time
reduce(lambda x, y:x+y, [1, 2, 3, 4, 5]) # calculates ((((1+2)+3)+4)+5)

# zip merges two sequences or lists and forms a list of tuples with corresponding items from each input
x = [1, 2, 3]
y = ['a', 'b', 'c', 'd']
zipped = zip(x, y) # outputs [(1, 'a'), (2, 'b'), (3, 'c')]
# zip(*matrix) == Transpose of a matrix

## Cartesian product, equivalent to a nested for-loop
product('ABCD', repeat=2)# AA AB AC AD   BA BB BC BD    CA CB CC CD   DA DB DC DD
## r-length tuples, all possible orderings, no repeated elements
permutations('ABCD', 2)  # AB AC AD    BA BC BD    CA CB CD    DA DB DC 
## r-length tuples, in sorted order, no repeated elements
combinations('ABCD', 2) # AB AC AD     BC BD     CD 
## r-length tuples, in sorted order, with repeated elements
combinations_with_replacement('ABCD', 2) # AA AB AC AD BB BC BD CC CD DD

# start a local web server
python -m http.server 8000

# new walrus operator, assignment expressions
i = 1
while (num := i) < 10:
    print(i, num, 'are the same number')
    i = i + 1

inputs = list()
while (current := input('write something: ')) != 'quit':
    inputs.append(current)

