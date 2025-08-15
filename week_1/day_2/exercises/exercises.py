# ------ Exercise 1
keys=["ten","twenty","thirty"]
values=[10,20,30]
dict1=dict(zip(keys,values))
print(dict1)
# ------ Exercise 2
family={}
num_of_people = int(input("Enter the number of people: "))
for i in range(num_of_people):
    name = input(f"Enter the name of person {i+1}: ")
    age = int(input(f"Enter the age of {name}: "))
    family[name] = age

total_cost = 0

for name, age in family.items():
    if age < 3:
        price = 0
    elif 3 <= age <= 12:
        price = 10
    else:
        price = 15
    
    total_cost += price
    print(f"{name.capitalize()} pays ${price}")

print(f"\nTotal cost for the family: ${total_cost}")
# ------ Exercise 3

brand = {
    "name": "Zara",
    "creation_date": 1975,
    "creator_name": "Amancio Ortega Gaona",
    "type_of_clothes": ["men", "women", "children", "home"],
    "international_competitors": ["Gap", "H&M", "Benetton"],
    "number_stores": 7000,
    "major_color": {
        "France": "blue",
        "Spain": "red",
        "US": ["pink", "green"]
    }
}

brand["number_stores"] = 2


print(f"Zara's clients are: {', '.join(brand['type_of_clothes'])}.")


brand["country_creation"] = "Spain"


if "international_competitors" in brand:
    brand["international_competitors"].append("Desigual")


del brand["creation_date"]


print("Last competitor:", brand["international_competitors"][-1])


print("US Colors:", brand["major_color"]["US"])


print("Number of key-value pairs:", len(brand))


print("Keys:", brand.keys())


more_on_zara = {
    "creation_date": 1975,
    "number_stores": 10000
}


brand.update(more_on_zara)


print("Number of stores after update:", brand["number_stores"])

# ------ Exercise 4
def describe_city(city, country="Iceland"):
    print(f"{city} is in {country}.")


describe_city("Reykjavik")       
describe_city("Casablanca", "Morocco")
describe_city("Paris", "France")


# ------ Exercise 5
import random

def guess_number():
    user_number = int(input("Enter a number between 1 and 100: "))
    random_number = random.randint(1, 100)

    if user_number == random_number:
        print(f"Success! Both numbers are {user_number}.")
    else:
        print(f" Fail! Your number: {user_number}, Random number: {random_number}")

guess_number()

# ------ Exercise 6
def make_shirt(size="Large", message="I love Python"):
    print(f"The size of the shirt is {size} and the text is '{message}'.")

make_shirt()
make_shirt("Medium")
make_shirt("Small", "shrit fur shirt")
make_shirt(message="Python is awesome!", size="Extra Large")

# ------ Exercise 7
import random

def get_random_temp(season):
    if season == "winter":
        return round(random.uniform(-10, 16), 1)
    elif season == "spring":
        return round(random.uniform(5, 23), 1)
    elif season == "summer":
        return round(random.uniform(20, 40), 1)
    elif season == "autumn" or season == "fall":
        return round(random.uniform(5, 20), 1)
    else:
        return round(random.uniform(-10, 40), 1)

def main():
    season = input("Enter the season (winter, spring, summer, autumn): ").lower()
    temp = get_random_temp(season)
    print(f"The temperature right now is {temp}°C.")
    if temp < 0:
        print("Brrr, that's freezing! Wear some extra layers today.")
    elif 0 <= temp <= 16:
        print("Quite chilly! Don’t forget your coat.")
    elif 17 <= temp <= 23:
        print("Nice weather! Enjoy your day.")
    elif 24 <= temp <= 32:
        print("It's warm! Perfect for outdoor activities.")
    elif 33 <= temp <= 40:
        print("It's very hot! Stay hydrated.")

main()

# ------ Exercise 8
data = [
    {"question": "What is Baby Yoda's real name?", "answer": "Grogu"},
    {"question": "Where did Obi-Wan take Luke after his birth?", "answer": "Tatooine"},
    {"question": "What year did the first Star Wars movie come out?", "answer": "1977"},
    {"question": "Who built C-3PO?", "answer": "Anakin Skywalker"},
    {"question": "Anakin Skywalker grew up to be who?", "answer": "Darth Vader"},
    {"question": "What species is Chewbacca?", "answer": "Wookiee"}
]

def ask_questions():
    correct = 0
    wrong = 0
    wrong_answers = []

    for i, item in enumerate(data, start=1):
        user_answer = input(f"Question {i}: {item['question']} ").strip()
        if user_answer.lower() == item["answer"].lower():
            correct += 1
        else:
            wrong += 1
            wrong_answers.append({
                "question": item["question"],
                "your_answer": user_answer,
                "correct_answer": item["answer"]
            })

    return correct, wrong, wrong_answers

def show_results(correct, wrong, wrong_answers):
    print(f"\nCorrect answers: {correct}")
    print(f"Incorrect answers: {wrong}")

    if wrong > 0:
        print("\nQuestions you got wrong:")
        for w in wrong_answers:
            print(f"Q: {w['question']}")
            print(f"Your answer: {w['your_answer']}")
            print(f"Correct answer: {w['correct_answer']}\n")

    if wrong > 3:
        retry = input("You had more than 3 wrong answers. Play again? (yes/no): ").lower()
        if retry == "yes":
            start_quiz()

def start_quiz():
    correct, wrong, wrong_answers = ask_questions()
    show_results(correct, wrong, wrong_answers)

start_quiz()
