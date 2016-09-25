class UsersController < ApplicationController

  def show
  	if logged_in?
    	@user = User.find(params[:id])
    	@reviews = @user.reviews.limit(5)
      @expiration = @user.date_format(@user.membership_expiration)
 	 	else
    	flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
    	# can change to redirect root_path once we have established what that is
    	redirect_to '/'
    end
  end

end
