import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';

class Game extends React.Component {
  constructor(props){
    super(props);
    this.gridSize = 9;
    this.bombSize = 2;
    this.winningNum = (this.gridSize * this.gridSize) - this.bombSize;
    this.state = {
      board: new Minesweeper.Board(this.gridSize, this.bombSize)             //object that we continiously update over the course of the game
    }
    this.updateGame = this.updateGame.bind(this)
  }
  updateGame(tile) {
    tile.explore();
    this.setState({ board: this.state.board });
  }

  restartGame(){
    let newBoard = new Minesweeper.Board(this.gridSize, this.bombSize);
    this.setState({ board: newBoard });
  }

  render (){ 
    // console.log(this.state.board);
    console.log(this.state.board.won())
    if (this.state.board.lost()){
      alert("You lost!");
      this.restartGame();
    }
    if (this.state.board.won() === this.winningNum) {
      alert("You won!");
      this.restartGame();
    }    

    return (
      <div className="game">
        <Board board={this.state.board} updateGame={this.updateGame}/>
      </div>
    )
  }
}

export default Game;