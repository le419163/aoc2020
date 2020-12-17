input = [15,5,1,4,7,0]
last_spoken = input[-1]
spoken = {n: i for i, n in enumerate(input, 1)} # one liner create dictionary
for i in range(len(input), 30000000): # for loop over 6..300000000
    spoken[last_spoken], last_spoken = i, i - spoken.get(last_spoken, i)
    # spoken[last_spoken] = i
    # last_spoken = i - spoken.get(last_spoken, i)
print(last_spoken)
    