import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
// import { receiveTodo, receiveTodos, removeTodo} from './actions/todo_actions';
import { receiveStep, receiveSteps, removeStep } from './actions/step_actions';

import * as TodoActions from './actions/todo_actions'; 
import Root from './components/root';
import { allTodos } from './reducers/selectors';
import { fetchTodos } from './util/todo_api_util';


// const preLoadedState = {
//     todos: {
//         1: {
//             id: 1,
//             title: 'take a shower',
//             body: 'and be clean',
//             done: false
//         },
//         2: {
//             id: 2,
//             title: 'go to the post office',
//             body: 'write letters',
//             done: false
//         }
//     },
//     steps: {
//       1: { // this is the step with id = 1
//         id: 1,
//         title: 'walk to store',
//         done: false,
//         todo_id: 1
//       },
//       2: { // this is the step with id = 2
//         id: 2,
//         title: 'buy soap',
//         done: false,
//         todo_id: 1
//       }
//     }
// };

document.addEventListener('DOMContentLoaded',()=>{
    const root = document.getElementById('root');
    const store = configureStore();
    ReactDOM.render(<Root store={store}/>, root);
    window.store = store;
    // window.receiveTodo = receiveTodo;
    // window.receiveTodos = receiveTodos;
    // window.removeTodo = removeTodo;
    window.TodoActions = TodoActions;     //same as above 3 lines
    window.receiveStep = receiveStep;
    window.receiveSteps = receiveSteps;
    window.removeStep = removeStep;
    window.allTodos = allTodos;
    window.fetchTodos = fetchTodos;
})

console.log("Webpack is running");


