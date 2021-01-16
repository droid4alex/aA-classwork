// const readline = require("readline");
// const reader = readline.createInterface({
//   input: process.stdin, 
//   output: process.stdout
// }) 

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
  if (numsLeft > 0){
    reader.question('add number', userInput => {
      const num = parseInt(userInput)
      sum += num;
    addNumbers(sum, numsLeft - 1, completionCallback);
    
      
    })
  
  }
  if (numsLeft === 0){
    completionCallback(sum)
    reader.close() 
  } 
}
addNumbers(0, 3, sum => {
  console.log(`Total Sum: ${sum}`)
});