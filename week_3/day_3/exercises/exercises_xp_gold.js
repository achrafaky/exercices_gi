// 🌟 Exercise 1 : is_Blank
function isBlank(str) {
  return str.length === 0;
}
console.log(isBlank(''));      // true
console.log(isBlank('abc'));   // false

// 🌟 Exercise 2 : Abbrev_name
function abbrevName(fullName) {
  let parts = fullName.split(" ");
  return parts[0] + " " + parts[1][0].toUpperCase() + ".";
}
console.log(abbrevName("Robin Singh")); // "Robin S."

// 🌟 Exercise 3 : SwapCase
function swapCase(str) {
  let swapped = "";
  for (let char of str) {
    if (char === char.toUpperCase()) {
      swapped += char.toLowerCase();
    } else {
      swapped += char.toUpperCase();
    }
  }
  return swapped;
}
console.log(swapCase("The Quick Brown Fox")); // "tHE qUICK bROWN fOX"

// 🌟 Exercise 4 : Omnipresent value
function isOmnipresent(arr, val) {
  for (let subArr of arr) {
    if (!subArr.includes(val)) {
      return false;
    }
  }
  return true;
}
console.log(isOmnipresent([[1,1],[1,3],[5,1],[6,1]],1)); // true
console.log(isOmnipresent([[1,1],[1,3],[5,1],[6,1]],6)); // false

// 🌟 Exercise 5 : Red table (diagonal cells in red)
// HTML déjà donné dans l'énoncé
// À mettre directement dans le <script> de la page :
let table = document.querySelector("table");
for (let i = 0; i < table.rows.length; i++) {
  let cell = table.rows[i].cells[i]; // cellule diagonale
  cell.style.backgroundColor = "red";
}
