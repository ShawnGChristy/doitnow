class TodosController < ApplicationController

  before_action :all_todos, only: [:index, :create, :update]
  before_action :set_todo, only: [:edit, :update, :destroy]

  def update
     @todo.update(todo_params) 
  end

  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    redirect_to todos_url
  end

  def destroy
    @todo.destroy
    redirect_to todos_url
  end

  def complete
    
    @todo.update_attribute(:completed_at, Time.now)
    redirect_to todos_url, notice: "Todo completed"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:name)
    end
end