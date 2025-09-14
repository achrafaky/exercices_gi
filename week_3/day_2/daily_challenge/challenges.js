// 🌟 Exercise : Replace "not ... bad" with "good"
let sentence = "The movie is not that bad, I like it";

// Trouver la position de "not" et "bad"
let wordNot = sentence.indexOf("not");
let wordBad = sentence.indexOf("bad");

// Vérification
if (wordNot !== -1 && wordBad !== -1 && wordBad > wordNot) {
  // Découper et remplacer la partie "not ... bad"
  let result = sentence.slice(0, wordNot) + "good" + sentence.slice(wordBad + 3);
  console.log(result);
} else {
  // Si "bad" ne vient pas après "not", afficher original
  console.log(sentence);
}

