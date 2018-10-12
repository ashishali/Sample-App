class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to action: "index"
      flash[:notice] = "User saved successfully"
    else 
      render :new
      flash[:notice] = "Something went wrong"
    end	
  end	  
  def edit
  end
  def user_params
    params.require(:user).permit!
  end	   
end
