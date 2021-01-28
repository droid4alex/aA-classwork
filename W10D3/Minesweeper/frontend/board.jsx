import React from 'react';
import * as Minesweeper from '../minesweeper';
import Tile from './tile';

class Board extends React.Component {
    constructor(props){
        super(props);
        // this.state = {
            // tile: new Tile()
            // grid: this.props.board.grid                           not needed, per Zach
        // }
    }

    render(){
        // console.log(this.props);
        const arr = this.props.board.grid.map((row, rowIdx) => {
            return (
                <div key={rowIdx} className="row">
                    {row.map((tile, tileIdx) => {
                        return (
                            <Tile key={`${rowIdx}${tileIdx}`} tile={tile} updateGame={this.props.updateGame} />
                        )
                    })
                    }
                </div>
            )
            })
        return(
            <div className="board">
                {arr}
            </div>
        )
    }
}

export default Board;

