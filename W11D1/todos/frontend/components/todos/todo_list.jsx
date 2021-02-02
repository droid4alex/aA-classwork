import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './../todo_list/todo_form';

class TodoList extends React.Component{
    constructor(props){
        super(props)
        this.render = this.render.bind(this);
    }

    componentDidMount(){
        this.props.getAllTodos()
    }

    render(){
        return (
            <div>
                <h1>All of your Todos:</h1>
                <ul>
                    {this.props.todos.map(todo => {
                        // return <li key={todo.id}>Todo: {todo.title}</li>
                        return (
                            <TodoListItem removeTodo={this.props.removeTodo} receiveTodo={this.props.receiveTodo} todo={todo} key={todo.id} />
                        )
                    })}
                </ul>
                <TodoForm receiveTodo={this.props.receiveTodo} createTodo={this.props.createTodo} />
            </div>
        )
    }
}

// const TodoList = (props) => {
//     return (
//         <div>
//             <h1>All of your Todos:</h1>
//             <ul>
//                 {props.todos.map(todo=>{
//                     // return <li key={todo.id}>Todo: {todo.title}</li>
//                   return (
//                     <TodoListItem removeTodo={props.removeTodo} receiveTodo={props.receiveTodo} todo={todo} key={todo.id}/>
//                   )
//                 })}
//             </ul>
//             <TodoForm receiveTodo={props.receiveTodo}/>
//         </div>
//     )
// }
export default TodoList;