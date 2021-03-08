class FollowingsController < ApplicationController
  before_action :set_following, only: %i[show edit update destroy]

  # GET /followings or /followings.json
  def index
    @followings = Following.all
  end

  # GET /followings/1 or /followings/1.json
  def show; end

  # GET /followings/new
  def new
    @following = Following.new
  end

  # GET /followings/1/edit
  def edit; end

  def check_reverse_pair(followed_id, follower_id)
    Following.where(followed_id: follower_id, follower_id: followed_id)
  end

  # POST /followings or /followings.json
  def create
    @sender = User.find(params[:follower_id])
    reverse_pair = check_reverse_pair(params[:followed_id], params[:follower_id])
    if reverse_pair.empty?
      @follow = Following.new(followed_id: params[:followed_id], follower_id: params[:follower_id])

      if @follow.save
        redirect_to user_path(id: params[:followed_id]), notice: 'Now following'
      else
        redirect_to user_path(id: params[:followed_id]), notice: 'You already followed each other'
      end
    else
      redirect_to user_path(id: params[:followed_id]), notice: 'User either follows you or you followed the user'
    end
  end


  # DELETE /followings/1 or /followings/1.json
  def destroy
    @following.destroy
    respond_to do |format|
      format.html { redirect_to followings_url, notice: 'Following was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 def unfollow
  reverse_pair = check_reverse_pair(params[:followed_id], params[:follower_id])
  if reverse_pair.empty?
    @follow = Following.where(followed_id: params[:followed_id], follower_id: params[:follower_id])
    @follow.destroy_all
    redirect_to user_path(id: params[:followed_id]), notice: 'User unfollowed'
  else
    reverse_pair.destroy_all
    redirect_to user_path(id: params[:followed_id]), notice: 'User unfollowed'
 end
end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_following
    @following = Following.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def following_params
    params.require(:following).permit(:follower_id, :followed_id)
  end
end
