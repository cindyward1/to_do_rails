class TasksController < ApplicationController

  def index
    @tasks_done = Task.where(:done=>true).order(:due_date)
    @tasks_todo = Task.where(:done=>false).order(:due_date)
    render('tasks/index.html.erb')
  end

  def new
    @task = Task.new
    render('tasks/new.html.erb')
  end

  def create
    @task = Task.new(task_params)
    @task.done = false
    if @task.save
      render('tasks/success.html.erb')
    else
      render('tasks/new.html.erb')
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render('tasks/success.html.erb')
    else
      render('tasks/index.html.erb')
    end
  end

private

  def task_params
    params.require(:task).permit(:name, :due_date, :done)
  end

end
