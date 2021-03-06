class PasswordResetsController < ApplicationController

  before_action :require_login

  def new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.send_password_reset 
    end
    redirect_to root_url, :notice => "Email sent with password reset instructions."
  end
  
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end
  
  def update
    @user = User.find_by_password_reset_token!(params[:id])

    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif params[:password] == params[:password_confirmation]
      @user.password = params[:user][:password]
      @user.save!
      redirect_to root_url, :notice => "Password has been reset!"
    elsif params[:password] != params[:password_confirmation]
      redirect_to new_password_reset_path, :alert => "Your new password entries do not match.  Please try again."
    else
      render :edit
    end
  end

end