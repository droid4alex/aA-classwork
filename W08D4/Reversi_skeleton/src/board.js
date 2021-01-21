// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let board = new Array(8).fill().map(() => new Array(8).fill());
  board[3][3] = new Piece(`white`);
  board[4][4] = new Piece(`white`);
  board[3][4] = new Piece(`black`);
  board[4][3] = new Piece(`black`);

  return board;
}
// console.log(_makeGrid());
/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let row = pos[0];
  let col = pos[1];
  return (row < 8 && row >= 0 && col < 8 && col >= 0)
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  let x = pos[0];
  let y = pos[1];
  // debugger
  if (this.isValidPos([x,y])) {
    return this.grid[x][y];
  } else {
    throw new Error('Not valid pos!');    
  };
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.getPiece(pos)){
    return (this.getPiece(pos).color === color);
  }
  else {
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return (this.getPiece(pos) ? true : false);
}

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
// for (let i = 0; i < Board.DIRS.length; i++) {
//   let piecesToFlip = this._positionsToFlip(pos, color, Board.DIRS[i])
//   console.log(piecesToFlip);
// }
 

Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
  if (!piecesToFlip) {
    piecesToFlip = [];
  } else {
    piecesToFlip.push(pos);
  }
  let nextPos = [pos[0] + dir[0], pos[1] + dir[1]];

  if (!this.isValidPos(nextPos)) {
    return [];
  } else if (!this.isOccupied(nextPos)) {
    return [];
  } else if (this.isMine(nextPos, color)) {
    return piecesToFlip.length == 0 ? [] : piecesToFlip;
  } else {
    
    return this._positionsToFlip(nextPos, color, dir, piecesToFlip);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
// finish this after writing positionsToFlip
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)){
    return false;
  }
  for (let i = 0; i < Board.DIRS.length; i++){

    if (this._positionsToFlip(pos, color, Board.DIRS[i]).length) {
      return true;
    }
  }
  return false;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
//return to this after we finish positionsToFlip
Board.prototype.placePiece = function (pos, color) {
  let x = pos[0];
  let y = pos[1];
  if (this.validMove(pos, color)) {
    this.grid[x][y] = new Piece(color);
    let positions = [];
    for (let i = 0; i < Board.DIRS.length; i++) {

      if (this._positionsToFlip(pos, color, Board.DIRS[i]).length) {
        positions = positions.concat(this._positionsToFlip(pos, color, Board.DIRS[i]));
      }
    }
    for (let i = 0; i < positions.length; i++) {
      this.getPiece(positions[i]).flip();
    }

  } else {
    throw new Error("Invalid move!")
  };
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let valids = [];
  for (let i = 0; i < 8; i++) {
    for (let j = 0; j < 8; j++) {
      if (this.validMove([i, j], color)){
        valids.push([i, j]);
      }      
    }
  }
  return valids;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  if (this.validMoves(color).length){
    return true;
  }
  return false;
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if (this.validMoves('white').length || this.validMoves('black').length) {
    return false;
  }
  return true;
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for (let i = 0; i < 8; i++){
    for (let j = 0; j < 8; j++) {
      pos = [i, j];
      if (this.isOccupied(pos)){
        console.log(this.getPiece(pos));        
      }
      else {
        console.log(' ');
      }
    }
  }
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE