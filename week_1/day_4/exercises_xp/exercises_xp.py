# ------ Exercise 1
class Pets():
    def __init__(self, animals):
        self.animals = animals

    def walk(self):
        for animal in self.animals:
            print(animal.walk())

class Cat():
    is_lazy = True

    def __init__(self, name, age):
        self.name = name
        self.age = age

    def walk(self):
        return f'{self.name} is just walking around'

class Bengal(Cat):
    def sing(self, sounds):
        return f'{sounds}'

class Chartreux(Cat):
    def sing(self, sounds):
        return f'{sounds}'

# 1️⃣ Créer une nouvelle race Siamese qui hérite de Cat
class Siamese(Cat):
    def sing(self, sounds):
        return f'{sounds}'

# 2️⃣ Créer une liste avec 3 chats : Bengal, Chartreux, Siamese
all_cats = [
    Bengal("Leo", 3),
    Chartreux("Misty", 2),
    Siamese("Luna", 4)
]

# 3️⃣ As

# ------ Exercise 2
class Dog:
    def __init__(self, name, age, weight):
        self.name = name
        self.age = age
        self.weight = weight

    def bark(self):
        return f"{self.name} is barking"

    def run_speed(self):
        return (self.weight / self.age) * 10

    def fight(self, other_dog):
        # Puissance = vitesse de course x poids
        my_power = self.run_speed() * self.weight
        other_power = other_dog.run_speed() * other_dog.weight

        if my_power > other_power:
            return f"{self.name} won the fight against {other_dog.name}"
        elif my_power < other_power:
            return f"{other_dog.name} won the fight against {self.name}"
        else:
            return f"The fight between {self.name} and {other_dog.name} is a draw!"


# 🐶 Créons 3 chiens
dog1 = Dog("Max", 5, 20)   # 5 ans, 20 kg
dog2 = D

# ------ Exercise 3
# dog.py

class Dog:
    def __init__(self, name, age, weight):
        self.name = name
        self.age = age
        self.weight = weight

    def bark(self):
        return f"{self.name} is barking"

    def run_speed(self):
        return (self.weight / self.age) * 10

    def fight(self, other_dog):
        my_power = self.run_speed() * self.weight
        other_power = other_dog.run_speed() * other_dog.weight
        if my_power > other_power:
            return f"{self.name} won the fight against {other_dog.name}"
        elif my_power < other_power:
            return f"{other_dog.name} won the fight against {self.name}"
        else:
            return f"The fight between {self.name} and {other_dog.name} is a draw"

# ------ Exercise 4
class Family:
    def __init__(self, last_name, members=None):
        self.last_name = last_name
        if members is None:
            self.members = []
        else:
            self.members = members

    def born(self, **kwargs):
        """Ajoute un nouveau membre à la famille"""
        self.members.append(kwargs)
        print(f"🎉 Félicitations à la famille {self.last_name} pour la naissance de {kwargs['name']} !")

    def is_18(self, name):
        """Vérifie si un membre a plus de 18 ans"""
        for member in self.members:
            if member['name'] == name:
                return member['age'] >= 18
        return False  # si la personne n’est pas trouvée

    def family_presentation(self):
        """Affiche la présentation de la famille"""
        print(f"👨‍👩‍👧‍👦 Famille {self.last_name}")
        for member in self.members:
            print(f" - {member['name']} | Âge: {member['age']} | Genre: {member['gender']} | Enfant: {member['is_child']}")


# ----------- TEST -------------
members_list = [
    {'name': 'Michael', 'age': 35, 'gender': 'Male', 'is_child': False},
    {'name': 'Sarah', 'age': 32, 'gender': 'Female', 'is_child': False}
]

my_family = Family(last_name="Smith", members=members_list)

# Présentation initiale
my_family.family_presentation()

# Vérification de l’âge
print("Michael est majeur ?", my_family.is_18("Michael"))
print("Sarah est majeure ?", my_family.is_18("Sarah"))

# Ajout d’un nouveau-né
my_family.born(name="Emma", age=1, gender="Female", is_child=True)

# Présentation après ajout
my_family.family_presentation()

# ------ Exercise 5
# ---------------- Base Class ----------------
class Family:
    def __init__(self, last_name, members=None):
        self.last_name = last_name
        if members is None:
            self.members = []
        else:
            self.members = members

    def born(self, **kwargs):
        """Ajoute un nouveau membre à la famille"""
        self.members.append(kwargs)
        print(f"🎉 Félicitations à la famille {self.last_name} pour la naissance de {kwargs['name']} !")

    def is_18(self, name):
        """Vérifie si un membre a plus de 18 ans"""
        for member in self.members:
            if member['name'] == name:
                return member['age'] >= 18
        return False  # si la personne n’est pas trouvée

    def family_presentation(self):
        """Affiche la présentation de la famille"""
        print(f"\n👨‍👩‍👧‍👦 Famille {self.last_name}")
        for member in self.members:
            print(f" - {member['name']} | Âge: {member['age']} | Genre: {member['gender']} | Enfant: {member['is_child']}")


# ---------------- Subclass ----------------
class TheIncredibles(Family):
    def use_power(self, name):
        """Affiche le pouvoir si le membre est majeur"""
        for member in self.members:
            if member['name'] == name:
                if member['age'] >= 18:
                    print(f"💥 {name} utilise son pouvoir: {member['power']} !")
                else:
                    raise Exception(f"{n

# ------ Exercise 6

# ------ Exercise 7

# ------ Exercise 8
