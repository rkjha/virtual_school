class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update]
	before_filter :correct_user, only: [:edit, :update]
  def show
  	@user = User.find(params[:id])
  	@title = @user.name
    @questions = @user.questions
    @questions_asked = @user.questions
  end

  def new
  	@user = User.new
  	@title = "Sign up"
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		#saved successfully
  		sign_in @user
  		flash[:success] = "Welcome to Virtual School!"
  		redirect_to @user
  	else
  		@title = "Sign up"
  		render 'new'
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile Updated Successfully"
			sign_in @user
			redirect_to @user
		else
			render 'edit'
		end
  end
  
  private

  def signed_in_user
  	redirect_to signin_path, notice: "Please Sign in" unless signed_in?
  end
  def correct_user
  	@user = User.find(params[:id])
  	redirect_to(root_path) unless current_user?(@user)
  end
end

