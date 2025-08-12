# ------ Exercise 1
True
True
False
False
True
False
 #x is True
#y is  False
a: 5
b: 10


# ------ Exercise 2
longest_sentence = ""  

while True:  
    sentence = input("Tape la phrase la plus longue possible sans la lettre 'A'  : ")
    
    if sentence == "": 
        break
    
    
    if 'a' in sentence.lower():
       print("Oops, il y a un 'A' quelque part, essaie encore !")
       continue  
    
    if len(sentence) > len(longest_sentence):
      longest_sentence = sentence
      print("Bravo, nouvelle meilleure phrase enregistrée !")


print(f"La meilleure phrase sans 'A' était :\n{longest_sentence}")

# ------ Exercise 3
paragraph = ""
num_chars = len(paragraph)

sentences = paragraph.split('.')  # sentences = [s.strip() for s in sentences if s.strip()]
num_sentences = len(sentences)

words = paragraph.split()
num_words = len(words)

unique_words = set(word.lower().strip('.,;:!?"\'') for word in words)
num_unique_words = len(unique_words)

non_whitespace_chars = len(paragraph.replace(" ", "").replace("\n", ""))

avg_words_per_sentence = num_words / num_sentences if num_sentences else 0

num_non_unique_words = num_words - num_unique_words

print(f"Caractères totaux : {num_chars}")
print(f"Nombre de phrases : {num_sentences}")
print(f"Nombre de mots : {num_words}")
print(f"Nombre de mots uniques : {num_unique_words}")
print(f"Caractères sans espaces : {non_whitespace_chars}")
print(f"Moyenne de mots par phrase : {avg_words_per_sentence:.2f}")
print(f"Mots non-uniques : {num_non_unique_words}")



# ------ Exercise 4

# ------ Exercise 5

# ------ Exercise 6

# ------ Exercise 7

# ------ Exercise 8
