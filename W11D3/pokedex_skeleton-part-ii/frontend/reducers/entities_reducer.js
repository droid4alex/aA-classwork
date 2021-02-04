import itemsReducer from './items_reducer';
import movesReducer from './moves_reducer';
import {combineReducers} from 'redux';
import pokemonReducer from './pokemon_reducer';

const entitiesReducer = combineReducers({
  pokemon: pokemonReducer,
  items: itemsReducer,
  moves: movesReducer
})

export default entitiesReducer;