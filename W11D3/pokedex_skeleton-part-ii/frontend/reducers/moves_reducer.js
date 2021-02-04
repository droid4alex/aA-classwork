import { RECEIVE_SINGLE_POKEMON } from './../actions/pokemon_actions';

const movesReducer = (prevState = {}, action) => {
  Object.freeze(prevState);
  let nextState = Object.assign({}, prevState);
  switch (action.type) {
    case RECEIVE_SINGLE_POKEMON:
      let moves = action.payload.moves;
      for (let move in moves) {
        nextState[moves[move].id] = moves[move];
      }
      return Object.assign({}, nextState)
    default:
      return prevState
  }
}

export default movesReducer;