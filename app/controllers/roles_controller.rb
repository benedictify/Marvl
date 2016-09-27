class RolesController < ApplicationController

	def new
    @roles = Role.new
	end

	def create
		@user = User.find(current_user.id)
		@role = Role.new(name: "Ambassador")
		if @role.save
			@user.add_role(@role.id)
			redirect_to @user
		else
			@errors = @role.errors.full_messages
      redirect_to @user
  	end
	end

	def admin
		@user = User.find(params[:user_id])
		@role = Role.new(name: "Admin")
		if @role.save
			@user.add_role(@role.id)
			flash[:role] = "Admin role has been added"
			redirect_to @user
		else
			@errors = @role.errors.full_messages
			redirect_to @user
		end
	end

	def member
		@user = User.find(params[:user_id])
		@role = Role.new(name: "Member")
		if @role.save
			@user.add_role(@role.id)
			flash[:role] = "Membership approved"
			redirect_to @user
		else
			@errors = @role.errors.full_messages
			redirect_to @user
		end
	end
end