// 🌟 Prompt user input
let input = prompt("Enter several words separated by commas:");

// Mettre les mots dans un tableau (trim pour enlever les espaces)
let words = input.split(",").map(word => word.trim());

// Trouver la longueur du mot le plus long
let maxLength = 0;
for (let word of words) {
  if (word.length > maxLength) {
    maxLength = word.length;
  }
}

// Construire la bordure
let border = "*".repeat(maxLength + 4);

// Affichage
console.log(border);
for (let word of words) {
  console.log(`* ${word.padEnd(maxLength, " ")} *`);
}
console.log(border);
