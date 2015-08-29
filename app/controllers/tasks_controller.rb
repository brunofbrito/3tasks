class TasksController < ApplicationController
  before_action :require_login
  def index
    @tasks = current_user.tasks.rank(:row_order).all
  end

  def new
    @task = Task.new
  end

  def update_row_order
    @task = Task.find(task_params[:task_id])
    @task.row_order_position = task_params[:row_order_position]
    @task.save

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  def create
    @task = Task.create(task_params)
    @task.user_id = current_user.id
    @task.save
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

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:task_id, :name, :description, :row_order_position, :user_id => current_user)
    end
 
end
