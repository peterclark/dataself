class Api::V1::GithubsController < Api::V1::ApiController
  version 1
  
  before_action :set_github, only: [:show]

  def index
    @githubs = Github.all
    expose @githubs
  end

  def show
    expose @github
  end

  def create
    commit_url = params[:commit_url]
    @github = Github.new(commit_url: commit_url)
    @github.save
    expose @github
  end
  
  def commits_by_day
    render_json label: 'Commits', values: [x: 1, y: 2]
  end
    

  private
    def set_github
      @github = Github.find(params[:id])
    end

    def github_params
      params.require(:github).permit(:commit_url)
    end
end
