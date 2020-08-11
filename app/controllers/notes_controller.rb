class NotesController < ApplicationController

  before_action :require_login
  def index
    if params[:project_id]
      @notes = Project.find_by(id: params[:project_id]).notes
    else
      @notes = Note.all
    end
  end

  def written
    @notes = Note.written
    render :index
  end

  def new
    @note = Note.new(project_id: params[:project_id])
    initialize_projects_and_texts
  end

  def create
    @note = Note.create(note_params)
    redirect_to project_path(@note.project_id)
  end

  def edit
    @note = Note.find_by(id: params[:id])
    initialize_projects_and_texts
  end

  private

  def note_params
    params.require(:note).permit(:project_id, :text_id, :content)
  end

  def initialize_projects_and_texts
    @projects = current_researcher.projects
    @texts = Text.all
  end
end