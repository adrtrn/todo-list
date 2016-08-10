class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to '/tasks'
    else
      render 'new'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :text)
  end
  
end
