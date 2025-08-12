# ------ Exercise 1
month = int(input("Enter the month number (1-12): "))

if 3 <= month <= 5:
    season = "Spring"
elif 6 <= month <= 8:
    season = "Summer"
elif 9 <= month <= 11:
    season = "Autumn"
elif month == 12 or month == 1 or month == 2:
    season = "Winter"
else:
    season = "Invalid month"

print(f"The season is: {season}")


# ------ Exercise 2
for num in range(1, 21):
    print(num)

print()

for index in range(1, 21):
    if index % 2 == 0:
        print(index)


# ------ Exercise 3


    my_name = "achraf"

while True:
    name = input("Quel est ton nom ? ").strip()
    if name.lower() == my_name.lower():
        print("Bravo, c’est bien toi !")
        break
    else:
        print("Non, essaie encore...") 



# ------ Exercise 4
names = ['Samus', 'Cortana', 'V', 'Link', 'Mario', 'Cortana', 'Samus']

user_name = input("Entre ton nom : ")

if user_name in names:
    index = names.index(user_name)
    print(f"Le nom '{user_name}' est trouvé à l'indice {index}.")
else:
    print(f"Désolé, le nom '{user_name}' n'est pas dans la liste.")
# ------ Exercise 5
num1 = int(input("Input the 1st number: "))
num2 = int(input("Input the 2nd number: "))
num3 = int(input("Input the 3rd number: "))

greatest = num1
if num2 > greatest:
    greatest = num2
if num3 > greatest:
    greatest = num3

print(f"The greatest number is: {greatest}")


# ------ Exercise 6
import random

wins = 0
losses = 0

while True:
    user_input = input("Entre un nombre entre 1 et 9 (ou 'stop' pour quitter) : ").strip()
    if user_input.lower() == 'stop':
        break
    if user_input.isdigit():
        guess = int(user_input)
        if 1 <= guess <= 9:
            number = random.randint(1, 9)
            if guess == number:
                print("Winner ! Tu as gagné.")
                wins += 1
            else:
                print(f"Better luck next time. Le nombre était {number}.")
                losses += 1
        else:
            print("Entre un nombre valide entre 1 et 9 !")
    else:
        print("Entre un nombre valide ou 'stop' pour quitter.")

print(f"Partie terminée. Victoires : {wins}, Défaites : {losses}. Merci d'avoir joué !")


# ------ Exercise 7

# ------ Exercise 8
