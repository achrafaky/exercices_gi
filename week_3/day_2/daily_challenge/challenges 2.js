// 🌟 Pattern Challenge

// Version 1 : One loop
let pattern = "";
for (let i = 1; i <= 6; i++) { pattern += "* ".repeat(i) + "\n"; }
console.log(pattern);

// Version 2 : Nested loops
let pattern2 = "";
for (let i = 1; i <= 6; i++) {
  for (let j = 1; j <= i; j++) { pattern2 += "* "; }
  pattern2 += "\n";
}
console.log(pattern2);
