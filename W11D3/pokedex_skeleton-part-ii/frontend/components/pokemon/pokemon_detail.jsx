import React from 'react'
import Route from 'react-router-dom'

class PokemonDetail extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <section className="pokemon-detail">
                <ul>
                    <li>{this.props.pokemon.name}</li>
                </ul>
            </section>
        )
    }
}