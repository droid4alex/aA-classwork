import { connect } from 'react-redux'
import PokemonDetail from './pokemon_detail'

const mapStateToProps = (state, ownProps) => {
    const pokemon = state.entities.pokemon[ownProps.match.params.]
}