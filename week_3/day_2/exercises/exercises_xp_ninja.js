// 🌟 Exercise 1 : Checking the BMI
const person1 = {
  fullName: "John Doe",
  mass: 85,
  height: 1.8,
  calcBMI: function() { return this.mass / (this.height * this.height); }
};

const person2 = {
  fullName: "Jane Smith",
  mass: 70,
  height: 1.65,
  calcBMI: function() { return this.mass / (this.height * this.height); }
};

function compareBMI(p1, p2) {
  let bmi1 = p1.calcBMI();
  let bmi2 = p2.calcBMI();
  if (bmi1 > bmi2) {
    console.log(`${p1.fullName} has the higher BMI (${bmi1.toFixed(2)})`);
  } else if (bmi2 > bmi1) {
    console.log(`${p2.fullName} has the higher BMI (${bmi2.toFixed(2)})`);
  } else {
    console.log(`Both have the same BMI (${bmi1.toFixed(2)})`);
  }
}
compareBMI(person1, person2);

// 🌟 Exercise 2 : Grade Average
function calculateAverage(gradesList) {
  let sum = 0;
  for (let i = 0; i < gradesList.length; i++) {
    sum += gradesList[i];
  }
  return sum / gradesList.length;
}

function findAvg(gradesList) {
  let avg = calculateAverage(gradesList);
  console.log("Average grade:", avg);
  if (avg >= 65) {
    console.log("Congratulations! You passed 🎉");
  } else {
    console.log("Unfortunately, you failed and must repeat the course ❌");
  }
}

// Example usage
findAvg([70, 80, 90]);   // Passed
findAvg([40, 50, 60]);   // Failed
