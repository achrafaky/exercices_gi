// 🌟 Exercise 1 : List of people
const people = ["Greg", "Mary", "Devon", "James"];
people.shift(); 
people[people.indexOf("James")] = "Jason";
people.push("Achraf");
console.log(people.indexOf("Mary"));
const copy = people.slice(1, people.length - 1);
console.log(copy);
console.log(people.indexOf("Foo")); // -1 car Foo n’existe pas
const last = people[people.length - 1];
console.log(last);

// 🌟 Exercise 2 : Favorite colors
const colors = ["Blue", "Red", "Green", "Black", "White"];
for (let i = 0; i < colors.length; i++) {
  console.log(`My #${i + 1} choice is ${colors[i]}`);
}
const suffixes = ["st", "nd", "rd", "th", "th"];
for (let i = 0; i < colors.length; i++) {
  console.log(`My ${i + 1}${suffixes[i]} choice is ${colors[i]}`);
}

// 🌟 Exercise 3 : Repeat the question
let num = Number(prompt("Enter a number:"));
while (num < 10) {
  num = Number(prompt("Enter a new number (must be >= 10):"));
}

// 🌟 Exercise 4 : Building Management
const building = {
  numberOfFloors: 4,
  numberOfAptByFloor: { firstFloor: 3, secondFloor: 4, thirdFloor: 9, fourthFloor: 2 },
  nameOfTenants: ["Sarah", "Dan", "David"],
  numberOfRoomsAndRent: { sarah: [3, 990], dan: [4, 1000], david: [1, 500] }
};
console.log(building.numberOfFloors);
console.log(building.numberOfAptByFloor.firstFloor, building.numberOfAptByFloor.thirdFloor);
console.log(building.nameOfTenants[1], building.numberOfRoomsAndRent.dan[0]);
let sarahRent = building.numberOfRoomsAndRent.sarah[1];
let davidRent = building.numberOfRoomsAndRent.david[1];
let danRent = building.numberOfRoomsAndRent.dan[1];
if (sarahRent + davidRent > danRent) { building.numberOfRoomsAndRent.dan[1] = 1200; }

// 🌟 Exercise 5 : Family
const family = { father: "John", mother: "Lisa", son: "Mike" };
for (let key in family) { console.log(key); }
for (let key in family) { console.log(family[key]); }

// 🌟 Exercise 6 : Rudolf
const details = { my: "name", is: "Rudolf", the: "reindeer" };
let sentence = "";
for (let key in details) { sentence += key + " " + details[key] + " "; }
console.log(sentence.trim());

// 🌟 Exercise 7 : Secret Group
const names = ["Jack", "Philip", "Sarah", "Amanda", "Bernard", "Kyle"];
const societyName = names.map(name => name[0]).sort().join("");
console.log(societyName); // "ABJKPS"
