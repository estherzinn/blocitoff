class TasksController < ApplicationController
  before_action :authenticate_user!

  respond_to :html
 
def index
  @to_do = current_user.tasks.where(state: "to_do")
  @doing = current_user.tasks.where(state: "doing")
  @done = current_user.tasks.where(state: "done")
  respond_with(@tasks)
end
 
def task_params
  params.require(:task).permit(:content,:state)
end
 
def create
  @task = current_user.tasks.new(task_params)
  @task.save
  respond_with(@task)
end

  

  

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
  end

 

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    
end
