class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = Project.find(params[:id])
    @task = @project.tasks.build
  end

  def new
  end
end
