class Api::TodosController < ApplicationController
    def show
        render json: Todo.find(params[:id])
    end
    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            render json: @todo
        else
            render json: @todo.errors.full_messages, status: 422
        end
    end
    def index
        @todo = Todo.all 
        render json: @todo
    end
    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
    end
    def update
        @todo = Todo.find(params[:id])
        if @todo.update(todo_params)
            render json: @todo 
        else
            render json: @todo.errors.full_messages
        end
    end
    private
    def todo_params
        params.require(:todo).permit(:title,:body,:done)
    end
end
