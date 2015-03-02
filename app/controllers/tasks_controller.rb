class TasksController < ApplicationController
  def create
    @project = Project.find(params[:task][:project])
    @task = @project.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        format.js {render 'created_task'}
      else
        format.js {render 'fail_crate_task'}
      end
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
    def task_params
      params.require(:task).permit(:title,:description,:time,:tag_list)
    end
end
