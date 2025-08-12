# ------ Challenge 1
number = int(input("Entre un nombre : "))
length = int(input("Entre la longueur de la liste : "))

multiples = [number * i for i in range(1, length + 1)]

print(multiples)

# ------ Challenge 2
word = input("Tape un mot : ")

result = ""
previous_char = ""

for char in word:
    if char != previous_char:
        result += char
    previous_char = char

print(result)

