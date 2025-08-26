from game import Game

def get_user_menu_choice():
    print("  \n       Menu:                   ")
    print("        g - jouer une nouvelle partie")
    print("        s - voir les scores")
    print("        q - Quitter")
    choice = input("Entrez votre choix: ").lower()
    if choice in ["g", "s", "q"]:
        return choice
    else:
     print("Choix invalide. Veuillez réessayer.")
    return get_user_menu_choice()
def print_game_results(results):
    print("============== Résultats de la partie ==============")
    print(f"victoire - {results['Win']}")
    print(f"défaite - {results['Lost']}")
    print(f"match nul - {results['Draw']}")
    print("\nmerci d'avoir joué!")
    print("===================================")
def main():
    game = Game()
    results = {"Win": 0, "Lost": 0, "Draw": 0}
    while True:
        user_choice = get_user_menu_choice()
        if user_choice == "g":
            result = game.play()
            results[result] += 1
        elif user_choice == "s":
            print_game_results(results)
        elif user_choice == "q":
            print("Merci d'avoir joué!")
            break
if __name__ == "__main__":
    main()