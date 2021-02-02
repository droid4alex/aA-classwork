
import { connect } from 'react-redux';
import { receiveTodo, getAllTodos, createTodo } from '../../actions/todo_actions';
import { removeTodo } from '../../actions/todo_actions';
import { allTodos} from './../../reducers/selectors';
import TodoList from './todo_list';

const mapStateToProps = (state)=>{
    return {
        todos: allTodos(state)
    }
}
const mapDispatchToProps =(dispatch) =>{
    return {
        receiveTodo: todo => dispatch(receiveTodo(todo)),
        removeTodo: todo => dispatch(removeTodo(todo)),
        getAllTodos: () => dispatch(getAllTodos()),
        createTodo: todo => dispatch(createTodo(todo)),
    }
}

export default connect(mapStateToProps,mapDispatchToProps)(TodoList);