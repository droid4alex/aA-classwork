import { connect } from 'react-redux'
import { requestSinglePokemon } from '../../actions/pokemon_actions'
import PokemonDetail from './pokemon_detail'

const mapStateToProps = (state, ownProps) => {
    let pokemon = state.entities.pokemon[ownProps.match.params.pokemonId]
    // debugger
    return {
        pokemon
    }  
}

const mapDispatchToProps = dispatch => {
    return {
        requestSinglePokemon: id => dispatch(requestSinglePokemon(id))
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail)