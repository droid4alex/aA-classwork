import React from 'react';
import * as Minesweeper from '../minesweeper';


class Tile extends React.Component {
    constructor(props){
        super(props);
        // this.state = {
        //     stub: "T"
        // }
        this.handleClick = this.handleClick.bind(this)
    }

    handleClick(){
        this.props.updateGame(this.props.tile);
    }

    render(){
        let tileClass = "tile unexplored";
        let tile = this.props.tile;
        if (tile.explored){
            tileClass = "tile explored";
        } 
        if (tile.bombed){
            tileClass = "tile bombed";
        }
        // if (tile.flagged) {
        //     tileClass = "tile flagged";
        // }


        
        return(
            <div className={`${tileClass}`} onClick={this.handleClick}>
                {tile.adjacentBombCount()}                
            </div>
        )
    }
}

export default Tile;