import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO} from './../actions/todo_actions';

const todosReducer = (state = {},action)=>{
    console.log("We are in todos reducer");

    Object.freeze(state);
    const nextState = Object.assign({},state);
    // debugger
    switch (action.type){
        case RECEIVE_TODOS:
            const newState = {}

            action.todos.forEach(obj=>{
                // nextState[obj.id] = obj;
                newState[obj.id] = obj;
            })
            return newState;
        case RECEIVE_TODO:
            nextState[action.todo.id] = action.todo;
            return nextState;
        case REMOVE_TODO:
            const idx = action.todo.id;
            if (idx){
                delete nextState[idx];
                return nextState;
            }
            else{
                //do you error function here
                return nextState;
            }
            
        default:
            return state;
    }
}
export default todosReducer;