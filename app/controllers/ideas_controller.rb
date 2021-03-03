class IdeasController < ApplicationController
  # before_action :require_login, only: %i[create index show new]
  before_action :authorized

  def index
    @idea = Idea.order('created_at DESC')
    @ideas = Idea.new
  end

  def new
    @ideas = Idea.new
  end

  def show; end

  #   # POST /users or /users.json
  def create
    current_user = User.find(session[:current_user_id])
    @idea = current_user.ideas.new(text: params[:idea])

    respond_to do |format|
      if @idea.save
        format.html { redirect_to ideas_path, notice: 'Idea successfully shared' }
      else
        format.html { redirect_to ideas_path, alert: "can't share idea now" }
      end
    end
  end

  def idea_params
    params.require(:idea).permit(:text)
  end
end
