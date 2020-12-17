from collections import Counter
from itertools import product
I = '...#...#\n..##.#.#\n###..#..\n........\n...##.#.\n.#.####.\n...####.\n..##...#'

# grid dictionary. x is row index, y is # index
grid = {(x,y,0,0):'#' for y, row in enumerate(I.split('\n')) for x, c in enumerate(row) if c == '#'}
print(str(grid))

# zip method combines two iterables
# tuple() creates new tuple, which is a type of list with round brackets
def add(v1, v2): 
    return tuple(e1+e2 for e1, e2 in zip(v1,v2))


# product creates a cartesian product (a table/grid)
def next(grid, Dw, D=(-1,0,1)):
    ns = Counter(add(p, d) for p in grid for d in product(D,D,D,Dw) if d != (0,0,0,0))
    return {p:'#' for p, n in ns.items() if n == 3 or (n == 2 and p in grid)}

# 6 cycles for loop
for _ in range(6): grid = next(grid, (0,))

print(len(grid))



#### second solution
from itertools import product

for p in [1, 2]:
  g = {(x,y) + (0,) * p for x,l in enumerate(open('17'))
                        for y,c in enumerate(l) if c == '#'}
    
  def a(c):
    n = len(g & set(product(*[range(a-1, a+2) for a in c])))
    return c in g and n == 4 or n == 3
    
  for r in range(6):
    g = set(filter(a, product(range(-r-1, r+8), repeat=2+p)))

  print(len(g))
