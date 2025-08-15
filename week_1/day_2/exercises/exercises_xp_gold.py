# ------ Exercise 1
birthdays = {
    "Alice": "1990/05/12",
    "Bob": "1985/11/23",
    "Charlie": "1992/07/08",
    "Diana": "1988/03/30",
    "Ethan": "1995/12/15"
}

print("Welcome! You can look up the birthdays of the people in the list!")

name = input("Enter the name of the person: ").strip()

if name in birthdays:
    print(f"{name}'s birthday is on {birthdays[name]}.")
else:
    print(f"Sorry, we don't have the birthday of {name}.")

# ------ Exercise 2
birthdays = {
    "Alice": "1990/05/12",
    "Bob": "1985/11/23",
    "Charlie": "1992/07/08",
    "Diana": "1988/03/30",
    "Ethan": "1995/12/15"
}

print("Welcome! You can look up the birthdays of the people in the list!")
print("Here are the people in the list:")
for name in birthdays:
    print(name)

name = input("Enter the name of the person: ").strip()

if name in birthdays:
    print(f"{name}'s birthday is on {birthdays[name]}.")
else:
    print(f"Sorry, we don’t have the birthday information for {name}.")

# ------ Exercise 3
def sum_pattern(x):
    x_str = str(x)
    total = int(x_str) + int(x_str*2) + int(x_str*3) + int(x_str*4)
    return total


result = sum_pattern(3)
print(result)  

# ------ Exercise 4

import random

def throw_dice():
    return random.randint(1, 6)

def throw_until_doubles():
    count = 0
    while True:
        die1 = throw_dice()
        die2 = throw_dice()
        count += 1
        if die1 == die2:
            break
    return count

def main():
    throws_needed = []
    for _ in range(100):
        throws_needed.append(throw_until_doubles())
    total_throws = sum(throws_needed)
    average_throws = round(total_throws / len(throws_needed), 2)
    print(f"Total throws: {total_throws}")
    print(f"Average throws to reach doubles: {average_throws}")

main()

# ------ Exercise 5

# ------ Exercise 6

# ------ Exercise 7

# ------ Exercise 8
