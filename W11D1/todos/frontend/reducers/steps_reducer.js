import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from './../actions/step_actions';

const stepsReducer = (state = {}, action) => {
  console.log("We are in steps reducer");

  Object.freeze(state);
  const nextState = Object.assign({}, state);
  // debugger
  switch (action.type) {
    case RECEIVE_STEPS:
      const newSteps = {};
      action.steps.forEach(obj => {
        // nextState[obj.id] = obj;
        newSteps[obj.id] = obj;
      })
      return newSteps;
    case RECEIVE_STEP:
      nextState[action.step.id] = action.step;
      return nextState;
    case REMOVE_STEP:
      const idx = action.step.id;
      if (idx) {
        delete nextState[idx];
        return nextState;
      }
      else {
        //do you error function here
        return nextState;
      }

    default:
      return state;
  }
}
export default stepsReducer;

// const newSteps = [{ 
//   id: 1, title: 'Dispatch actions', done: false, todo_id: 1 },
//    { id: 2, title: 'Test #2', done: false, todo_id: 2 }];