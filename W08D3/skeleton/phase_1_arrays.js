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
  let arr = [];

  for (i = 0; i < this.length; i++) {
    for (j = i; j < this.length; j++) {
      if (i !== j && this[i] + this[j] === 0) {
        arr.push(i, j);
      }
    }
  }

  return arr;
}

// console.log([1, 5, 4, -5].twoSum()) // => [1, 3])

Array.prototype.transpose = function() {
  let arr = [];
  for (i = 0; i < this.length; i++) {
    let row = [];
    for (j = 0; j < this.length; j++) {
      row.push(this[j][i])
    }
    arr.push(row);
  }
  return arr;
}
// arr2 = [[1,2],["a","b"]].transpose()
// console.log(arr2)