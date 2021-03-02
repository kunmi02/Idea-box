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

  def show
  end

  #   # POST /users or /users.json
  def create
    current_user = User.find(session[:current_user_id])
    @idea = current_user.ideas.new(text: params[:idea])

    respond_to do |format|
      if @idea.save
        format.html { redirect_to ideas_path, notice: "Idea successfully shared" }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to ideas_path, alert: "can't share idea now" }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def idea_params
        params.require(:idea).permit(:text)
      end
end

# class UsersController < ApplicationController
#   before_action :set_user, only: %i[ show edit update destroy ]

#   # GET /users or /users.json
#   def index
#     @users = User.all
#   end

#   # GET /users/1 or /users/1.json
#   def show
#   end

#   # GET /users/new
#   def new
#     @user = User.new
#   end

#   # GET /users/1/edit
#   def edit
#   end

#   def sign_in
#   end

#   # POST /users or /users.json
#   def create
#     @user = User.new(user_params)

#     respond_to do |format|
#       if @user.save
#         format.html { redirect_to @user, notice: "User was successfully created." }
#         format.json { render :show, status: :created, location: @user }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /users/1 or /users/1.json
#   def update
#     respond_to do |format|
#       if @user.update(user_params)
#         format.html { redirect_to @user, notice: "User was successfully updated." }
#         format.json { render :show, status: :ok, location: @user }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /users/1 or /users/1.json
#   def destroy
#     @user.destroy
#     respond_to do |format|
#       format.html { redirect_to users_url, notice: "User was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_user
#       @user = User.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def user_params
#       params.require(:user).permit(:username, :fullname, :photo, :cover_image)
#     end
# end
