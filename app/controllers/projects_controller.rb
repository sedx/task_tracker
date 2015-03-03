class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = Project.find(params[:id])
    @task = @project.tasks.build
    @tasks = Task.all
  end

  def new
  end
end
