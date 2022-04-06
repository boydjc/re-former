class UsersController < ApplicationController

  def index
  end

  def new
  	@user = User.new
  end

  def create
  	#@user = User.new(username: params[:username], email: params[:email], password: params[:password])
  	@user = User.new(user_params)

	if @user.save
	  redirect_to new_user_path
	else
	  render :new, status: :unprocessable_entity
	  puts @user.errors.full_messages
	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    # find the user
	@user = User.find(params[:id])
	
	if @user.update(user_params)
	  redirect_to edit_user_path
	else
	  render :edit, status: :unprocessable_entity
	end
  end

  def user_params
  	params.require(:user).permit(:username, :email, :password)
  end

  end
