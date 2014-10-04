class GithubsController < ApplicationController
  before_action :set_github, only: [:show]

  def index
    @githubs = Github.recent.page params[:page]
    respond_with(@githubs)
  end

  def show
    respond_with(@github)
  end
  
  private
  
  def set_github
    @github = Github.find(params[:id])
  end

end
