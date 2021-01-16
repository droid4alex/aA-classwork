const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback){

  reader.question(`Is ${el1} greater than ${el2}? `, function (res){

    if (res === "y"){
      callback(true)
    }
    else {
      callback(false)
    }
  })
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop){
  if (i === (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps);
    return;
  }
  madeAnySwaps = false;
  //  if (i < arr.length - 1){
   askIfGreaterThan(arr[i], arr[i + 1], isGreaterThan => {
     if (isGreaterThan) {
        el1 = arr[i] 
        el2 = arr[i + 1] 
       arr[i + 1] = el1 
       arr[i] = el2
       madeAnySwaps = true;
    }
    innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop)
   })
  //  }
};
function absurdBubbleSort(arr, sortCompletionCallback){
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps){

      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop)
    }
    else {
      sortCompletionCallback(arr)
    }
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
  }
  outerBubbleSortLoop(true);
};
// Kick the first outer loop off, starting `madeAnySwaps` as true.

absurdBubbleSort([3, 2, 1], function(arr) {
console.log("Sorted array: " + JSON.stringify(arr));
reader.close();
});




