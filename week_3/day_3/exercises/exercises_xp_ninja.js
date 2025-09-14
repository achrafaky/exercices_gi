// 🌟 Exercise 1: Random Number
let randomNum = Math.floor(Math.random() * 100) + 1;
console.log("Random number:", randomNum);
for (let i = 0; i <= randomNum; i++) {
  if (i % 2 === 0) console.log(i);
}

// 🌟 Exercise 2: Capitalized letters
function capitalize(str) {
  let even = "";
  let odd = "";
  for (let i = 0; i < str.length; i++) {
    if (i % 2 === 0) {
      even += str[i].toUpperCase();
      odd += str[i];
    } else {
      even += str[i];
      odd += str[i].toUpperCase();
    }
  }
  return [even, odd];
}
console.log(capitalize("abcdef")); // ['AbCdEf', 'aBcDeF']

// 🌟 Exercise 3: Is palindrome?
function isPalindrome(str) {
  let reversed = str.split("").reverse().join("");
  return str === reversed;
}
console.log(isPalindrome("madam")); // true
console.log(isPalindrome("hello")); // false

// 🌟 Exercise 4: Biggest Number
function biggestNumberInArray(arrayNumber) {
  let max = 0;
  for (let val of arrayNumber) {
    if (typeof val === "number" && val > max) {
      max = val;
    }
  }
  return max;
}
console.log(biggestNumberInArray([-1,0,3,100,99,2,99])); // 100
console.log(biggestNumberInArray(['a', 3, 4, 2])); // 4
console.log(biggestNumberInArray([])); // 0

// 🌟 Exercise 5: Unique Elements
function uniqueElements(arr) {
  let unique = [];
  for (let val of arr) {
    if (!unique.includes(val)) {
      unique.push(val);
    }
  }
  return unique;
}
console.log(uniqueElements([1,2,3,3,3,3,4,5])); // [1,2,3,4,5]

// 🌟 Exercise 6: Calendar
function createCalendar(year, month) {
  let mon = month - 1; // month in JS is 0-based
  let d = new Date(year, mon);

  let table = "<table><tr><th>MO</th><th>TU</th><th>WE</th><th>TH</th><th>FR</th><th>SA</th><th>SU</th></tr><tr>";

  // fill first row with blanks if needed
  for (let i = 0; i < (d.getDay() + 6) % 7; i++) {
    table += "<td>.</td>";
  }

  while (d.getMonth() === mon) {
    table += "<td>" + d.getDate() + "</td>";

    if (d.getDay() === 0) { // Sunday, wrap to next row
      table += "</tr><tr>";
    }

    d.setDate(d.getDate() + 1);
  }

  // close the table
  table += "</tr></table>";
  document.body.innerHTML += table;
}

// Example usage:
// createCalendar(2012, 9); // September 2012
