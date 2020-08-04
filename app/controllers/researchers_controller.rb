class ResearchersController < ApplicationController
  def new
    @researcher = Researcher.new
  end

  def create
    @researcher = Researcher.new(researcher_params)
    if @researcher.save
      login_researcher(@researcher)
      byebug
      redirect_to @researcher
    else
      render :new
    end
  end

  def show

  end

  def login
    @researcher
  end

  def logout

  end

  private

  def researcher_params
    params.require(:researcher).permit(:name, :email, :institution, :password)
  end

  def login_researcher(researcher)
    session[:researcher_id] = researcher.id
  end
end