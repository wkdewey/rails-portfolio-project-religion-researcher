class ProjectsController < ApplicationController

  def show
    @project = Project.find_by(id: params[:id])
  end

end