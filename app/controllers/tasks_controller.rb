class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
    @limit = if @tasks.size == 3
      "You can't add any more tasks for now. Let's get to work!"
    elsif @tasks.size == 2
      "You can still add 1 lovely task for today!"
    elsif @tasks.size == 1
      "You can still add 2 more tasks for today!"
    else
      "You can still add 3 more tasks for today!"
    end
  end

  def create
    Task.create(task_params)
    redirect_to tasks_path
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    Task.find(params[:id]).update(task_params)
    redirect_to tasks_path
  end

  def destroy
    Task.destroy(params[:id])
    redirect_to tasks_path
  end

  private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def task_params
      params.require(:task).permit(:name, :description)
    end
 
end
