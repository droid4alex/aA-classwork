// /* forEach */

// arr = [1, 2, 3]


// function myFunc(theObject) {
  //   console.log(theObject);
  // }
  //Zach's example... cb and myFunct are the same
  let cb = function(el) {
    return el*2;
  }
Array.prototype.myEach = function(cb) {
  for (i=0; i<this.length; i++){
    cb(this[i])
    // cb(this[i])
  }
}

Array.prototype.myMap = function(cb) {
  let arr = [];

  // function asdf(el) {

  //   arr.push(cb(el))
  // }

  // this.myEach(asdf)
  this.myEach( el =>  arr.push(cb(el)) )
  return arr;
}

// let arr = [1, 2, 3];
// console.log(arr.myMap(cb));

Array.prototype.myReduce = function(cb, initial) {
  let acc = initial;
  acc ||= this[0];
  this.myEach( el => acc += cb(el))
  return acc;
}
// let cb = function (el) {
//   return el * 2;
// }
let arr = [1, 2, 3];
console.log(arr.myReduce(cb));