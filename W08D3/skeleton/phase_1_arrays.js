Array.prototype.uniq = function() {
  let arr = [];
  for (let i = 0; i < this.length; i++){
    if (arr.includes(this[i])){
      continue;
    } else {
      arr.push(this[i]);
    }
  }
  return arr;
}

// console.log([1, 2, 2, 3, 3, 3].uniq()) // => [1, 2, 3])

Array.prototype.twoSum = function() {

}

console.log([1, 5, 4, -5].twoSum()) // => [1, 3])