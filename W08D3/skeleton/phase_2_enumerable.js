// /* forEach */

// arr = [1, 2, 3]

// let cb = function(el) {
//   console.log(el)
// }

// function myFunc(theObject) {
//   console.log(theObject);
// }
//Zach's example... cb and myFunct are the same
Array.prototype.myEach = function(cb) {
  for (i=0; i<this.length; i++){
    cb(i)
    // cb(this[i])
  }
}

Array.prototype.myMap = function(cb) {
  let arr = [];
  // this.myEach(arr.push(cb))  
  arr.push(cb(this.myEach))
  return arr;
}

arr = [1, 2, 3];
arr.myMap(console.log);