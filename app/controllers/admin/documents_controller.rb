class Admin::DocumentsController < ApplicationController

	def index
		if admin?
			@user = current_user
			@documents = Document.all
			
		else
      flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
      redirect_to '/'
    end
	end
end