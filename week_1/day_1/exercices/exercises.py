# ------ Exercise 1

print("Hello world")
print("Hello world")
print("Hello world")
print("Hello world")




# ------ Exercise 2
result = (99 ** 3) * 8
print(result)


# ------ Exercise 3
name = input("Quel est ton prénom ? ")
my_name = "Achraf"

if name.lower() == my_name.lower():
    print(" hhhhhh ah bon On a le même prénom, mais je suis l'original ")
else:
    print(f" va refaire un autre prénom, {my_name} c'est le meilleur prenom ")

# ------ Exercise 4
taille = int(input("entrez votre taille en cm ? "))


if taille > 145:
    print("Tu es assez grand , vasy")
else:
   print("Désolé, il faut encore grandir un peu ")
# ------ Exercise 5
my_fav_numbers = {6, 8, 10}


my_fav_numbers.add(19)
my_fav_numbers.add(30)


my_fav_numbers.remove(30)
friend_fav_numbers = {3, 9, 55}
our_fav_numbers = my_fav_numbers.union(friend_fav_numbers)

print("Mes nombres préférés sont :", my_fav_numbers)
print("Nombres préférés de mon ami sont :", friend_fav_numbers)
print("Nos nombres préférés sont:", our_fav_numbers)

# ------ Exercise 6
my_tuple = (1, 2, 3)
new_tuple = (4,5)
my_tuple = my_tuple + new_tuple

print(my_tuple) 
# ------ Exercise 7
basket = ["Banana", "Apples", "Oranges", "Blueberries"]

basket.remove("Banana")
basket.remove("Blueberries")

basket.append("Kiwi")
basket.insert(0, "Apples")

count_apples = basket.count("Apples")
print(f"Nombre de pommes dans le panier : {count_apples}")

basket.clear()
print(basket)


# ------ Exercise 8
sandwich_orders = [
    "Tuna sandwich", "Pastrami sandwich", "Avocado sandwich",
    "Pastrami sandwich", "Egg sandwich", "Chicken sandwich", "Pastrami sandwich"
]

while "Pastrami sandwich" in sandwich_orders:
    sandwich_orders.remove("Pastrami sandwich")

finished_sandwiches = []

while sandwich_orders:
    current_sandwich = sandwich_orders.remove(0)
    finished_sandwiches.append(current_sandwich)

for sandwich in finished_sandwiches:
    print(f"I made your {sandwich}")

