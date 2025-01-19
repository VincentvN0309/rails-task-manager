class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id]) # Find the task by ID
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to "/tasks", notice: "Task created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to "/tasks", notice: "Task updated sucessfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def toggle_completed
    @task = Task.find(params[:id])
    @task.update(completed: !@task.completed) # Toggle the status
    redirect_to tasks_path, notice: "Task updated successfully"
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
