// 🌟 Exercise 1 : Numbers divisible by 23
function displayNumbersDivisible(divisor = 23) {
  let sum = 0;
  for (let i = 0; i <= 500; i++) {
    if (i % divisor === 0) {
      console.log(i);
      sum += i;
    }
  }
  console.log("Sum:", sum);
}
displayNumbersDivisible();       // default (23)
displayNumbersDivisible(3);      // bonus example
displayNumbersDivisible(45);

// 🌟 Exercise 2 : Shopping List
const stock = { banana: 6, apple: 0, pear: 12, orange: 32, blueberry: 1 };
const prices = { banana: 4, apple: 2, pear: 1, orange: 1.5, blueberry: 10 };
let shoppingList = ["banana", "orange", "apple"];

function myBill() {
  let total = 0;
  for (let item of shoppingList) {
    if (item in stock && stock[item] > 0) {
      total += prices[item];
      stock[item] -= 1; // bonus: decrease stock
    }
  }
  return total;
}
console.log("Total Bill:", myBill());

// 🌟 Exercise 3 : What’s in my wallet ?
function changeEnough(itemPrice, amountOfChange) {
  const values = [0.25, 0.10, 0.05, 0.01];
  let sum = 0;
  for (let i = 0; i < values.length; i++) {
    sum += amountOfChange[i] * values[i];
  }
  return sum >= itemPrice;
}
console.log(changeEnough(4.25, [25, 20, 5, 0])); // true
console.log(changeEnough(14.11, [2, 100, 0, 0])); // false
console.log(changeEnough(0.75, [0, 0, 20, 5]));   // true

// 🌟 Exercise 4 : Vacation Costs
function hotelCost(nights) { return nights * 140; }
function planeRideCost(destination) {
  if (destination === "London") return 183;
  if (destination === "Paris") return 220;
  return 300;
}
function rentalCarCost(days) {
  let cost = days * 40;
  if (days > 10) cost *= 0.95;
  return cost;
}
function totalVacationCost() {
  let nights = Number(prompt("How many nights in hotel?"));
  let destination = prompt("What is your destination?");
  let days = Number(prompt("How many days car rental?"));

  let hotel = hotelCost(nights);
  let plane = planeRideCost(destination);
  let car = rentalCarCost(days);

  console.log(`The car cost: $${car}, the hotel cost: $${hotel}, the plane tickets cost: $${plane}.`);
  return car + hotel + plane;
}
// totalVacationCost();  // call when running in browser

// 🌟 Exercise 5 : Users
let div = document.getElementById("container");
console.log(div);
let lists = document.querySelectorAll(".list");

// Change Pete -> Richard
lists[0].children[1].textContent = "Richard";

// Delete Sarah (2nd li of 2nd ul)
lists[1].children[1].remove();

// Change first li of each ul to my name
lists.forEach(ul => ul.children[0].textContent = "Achraf");

// Add classes
lists.forEach(ul => ul.classList.add("student_list"));
lists[0].classList.add("university", "attendance");

// Styling
div.style.backgroundColor = "lightblue";
div.style.padding = "10px";

// Hide Dan (if still present)
let allLi = document.querySelectorAll("li");
allLi.forEach(li => { if (li.textContent === "Dan") li.style.display = "none"; });

// Border around Richard
allLi.forEach(li => { if (li.textContent === "Richard") li.style.border = "1px solid black"; });

// Change body font size
document.body.style.fontSize = "18px";

// Bonus: hello if lightblue
if (div.style.backgroundColor === "lightblue") {
  let users = Array.from(document.querySelectorAll("ul li")).map(li => li.textContent);
  alert(`Hello ${users[0]} and ${users[1]}`);
}

// 🌟 Exercise 6 : Change the navbar
let nav = document.getElementById("navBar");
nav.setAttribute("id", "socialNetworkNavigation");

// Add Logout
let ul = nav.querySelector("ul");
let li = document.createElement("li");
li.textContent = "Logout";
ul.appendChild(li);

// First and last element
console.log("First link:", ul.firstElementChild.textContent);
console.log("Last link:", ul.lastElementChild.textContent);

// 🌟 Exercise 7 : My Book List
const allBooks = [
  { title: "Harry Potter", author: "J.K. Rowling", image: "https://picsum.photos/100", alreadyRead: true },
  { title: "The Hobbit", author: "J.R.R. Tolkien", image: "https://picsum.photos/101", alreadyRead: false }
];

let section = document.querySelector(".listBooks");
allBooks.forEach(book => {
  let divBook = document.createElement("div");
  divBook.innerHTML = `<p>${book.title} written by ${book.author}</p><img src="${book.image}" width="100">`;
  if (book.alreadyRead) { divBook.style.color = "red"; }
  section.appendChild(divBook);
});
