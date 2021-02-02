import React from 'react';

// class TodoListItem extends React.Component{
//   constructor(props){
//     super(props)
//     this.handleClick = this.handleClick.bind(this);
//   }

//   handleClick(e){
//     this.props.removeTodo(this.props.todo);
//   }

//   render() {
//     return (
//       <>
//         <li key={this.props.todo.id}>
//           Todo: {this.props.todo.title} {this.props.todo.body}
//         </li>
//         <button onClick={this.handleClick}>Delete</button>
//       </>
//     )
//   }
// }

const TodoListItem = (props) => {
  const handleClick=(e)=>{
    props.removeTodo(props.todo);
  }
  return (
    <>
      <li key={props.todo.id}>
        Todo: {props.todo.title} {props.todo.body}
      </li>
      <button onClick={handleClick}>Delete</button>
    </>
  )
}

export default TodoListItem;