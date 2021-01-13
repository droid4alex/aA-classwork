// /* forEach */

// arr = [1, 2, 3]

let cb = function(el) {
  return el*2;
}

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
  let arr = this;
  // this.myEach(arr.push(cb))  
  // arr.push(cb(this.myEach))
  function doSomething(){
    arr = arr.myEach(cb)
  }
  doSomething();
  return arr;
}

let arr = [1, 2, 3];
console.log(arr.myMap(cb));