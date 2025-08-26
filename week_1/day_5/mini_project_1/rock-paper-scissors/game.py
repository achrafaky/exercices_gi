import random

class Game:
    def __init__(self):
        pass
    def get_user_item(self):
        while True:
            user_item = input("Entrez votre choix (rock, paper, scissors): ").lower()
            if user_item in ["rock", "paper", "scissors"]:
                return user_item
            else:
                print("Choix invalide. Veuillez réessayer.")
    def get_computer_item(self):
        return random.choice(["rock", "paper", "scissors"])

    def get_game_results(self, user_item, computer_item):
        if user_item == computer_item:
            return "Draw"
        elif (user_item == "rock" and computer_item == "scissors") or \
             (user_item == "paper" and computer_item == "rock") or \
             (user_item == "scissors" and computer_item == "paper"):
            return "Win"
        else:
            return "Lost"
    def play(self):
        user_item = self.get_user_item()
        computer_item = self.get_computer_item()
        results = self.get_game_results(user_item, computer_item)
        if results == "Win":
            print("Félicitations! Vous avez gagné!")
        elif results == "Lost":
            print("Désolé! Vous avez perdu.")
        else:
            print("Match nul!")
        return results