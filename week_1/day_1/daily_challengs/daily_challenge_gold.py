from datetime import datetime

birthdate = input("Entre ta date de naissance (DD/MM/YYYY) : ")
birth = datetime.strptime(birthdate, "%d/%m/%Y")
today = datetime.today()

age = today.year - birth.year
if (today.month, today.day) < (birth.month, birth.day):
    age -= 1

last_digit = age % 10
candles = "i" * (last_digit + 3)

print("   ___" + candles + "___")
print("  |:H:a:p:p:y:|")
print(" __|___________|__")
print("|^^^^^^^^^^^^^^^^^|")
print("|:B:i:r:t:h:d:a:y:|")
print("|                 |")
print("~~~~~~~~~~~~~~~~~~~")

print(f"Joyeux {age}ème anniversaire !")
