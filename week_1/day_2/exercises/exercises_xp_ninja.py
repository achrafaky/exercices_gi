# ------ Exercise 1

cars = "Volkswagen, Toyota, Ford Motor, Honda, Chevrolet".split(", ")


print(f"There are {len(cars)} manufacturers in the list.")


print("Manufacturers Z-A:", sorted(cars, reverse=True))


print("Manufacturers with 'o':", sum(1 for car in cars if 'o' in car.lower()))


print("Manufacturers without 'i':", sum(1 for car in cars if 'i' not in car.lower()))


cars_with_duplicates = ["Honda", "Volkswagen", "Toyota", "Ford Motor", "Honda", "Chevrolet", "Toyota"]
unique_cars = list(set(cars_with_duplicates))
print(f"Unique companies ({len(unique_cars)}): {', '.join(unique_cars)}")


print("A-Z with letters reversed:", [car[::-1] for car in sorted(unique_cars)])

# ------ Exercise 2
def get_full_name(first_name, last_name, middle_name=""):
    if middle_name:
        return f"{first_name.title()} {middle_name.title()} {last_name.title()}"
    else:
        return f"{first_name.title()} {last_name.title()}"

first = input("Enter your first name: ").strip()
middle = input("Enter your middle name (press Enter if none): ").strip()
last = input("Enter your last name: ").strip()

print("Full name:", get_full_name(first, last, middle))

# ------ Exercise 3
MORSE_CODE_DICT = {
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.',
    'G': '--.', 'H': '....', 'I': '..', 'J': '.---', 'K': '-.-', 'L': '.-..',
    'M': '--', 'N': '-.', 'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.',
    'S': '...', 'T': '-', 'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-',
    'Y': '-.--', 'Z': '--..', '0': '-----', '1': '.----', '2': '..---',
    '3': '...--', '4': '....-', '5': '.....', '6': '-....', '7': '--...',
    '8': '---..', '9': '----.', ' ': '/'
}

def english_to_morse(text):
    return ' '.join(MORSE_CODE_DICT.get(c.upper(), '') for c in text)

def morse_to_english(code):
    inv = {v:k for k,v in MORSE_CODE_DICT.items()}
    return ''.join(inv.get(s,'') for s in code.split())

word = input("Enter a word or phrase: ")
morse = english_to_morse(word)
print("Morse:", morse)

english = morse_to_english(morse)
print("English:", english)

# ------ Exercise 4

# ------ Exercise 5

# ------ Exercise 6

# ------ Exercise 7

# ------ Exercise 8
