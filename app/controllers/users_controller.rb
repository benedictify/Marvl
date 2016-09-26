class UsersController < ApplicationController

  def show
  	if logged_in?
    	@user = User.find(params[:id])
    	@reviews = @user.reviews.limit(5)
    else
      flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
      # can change to redirect root_path once we have established what that is
      redirect_to '/'
    end
  end

  def edit
  	@user = User.find(params[:id])
  	unless @user.id == current_user.id
			flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
      redirect_back
		end
  end

  def update
  	@user = User.find(params[:id])
    if @user.id == current_user.id
  		@user.update_attributes(title: params[:user][:title], first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email])
	  	redirect_to @user
    else
      flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
      redirect_to @user
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
      flash[:new] = "An administrator will notify you when your account has been confirmed"
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit!
  end
end
