import { RECEIVE_SINGLE_POKEMON } from './../actions/pokemon_actions';

const itemsReducer = (prevState = {}, action) => {
  Object.freeze(prevState);
  let nextState = Object.assign({}, prevState);
  switch(action.type) {
    case RECEIVE_SINGLE_POKEMON:
      
      // let poke = action.payload;
      let items = action.payload.items;

      for (let item in items){
        nextState[items[item].id] = items[item];
      }
      // items.forEach(item => {
      //   nextState[item.id] = item
      // });
      return Object.assign({}, nextState)
      // debugger
    default:
      return prevState
  }
}

export default itemsReducer;