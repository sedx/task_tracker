class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = Project.find(params[:id])
    @task = @project.tasks.build
    @tasks = @project.tasks
  end

  def new
  end
end
