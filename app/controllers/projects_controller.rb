class ProjectsController < ApplicationController
  before_filter :check_access, only: :show
  def index
  end

  def show
    @project = Project.find(params[:id])
    @task = @project.tasks.build
    @tasks = @project.tasks
  end

  private

    def check_access
      unless current_user.available_projects.include?(Project.find(params[:id]))
        redirect_to root_path
      end
    end

end
