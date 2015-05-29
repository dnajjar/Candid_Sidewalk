class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end 
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]  = @user.id
      redirect_to @user, notice: "Your account has been created!"
    else
      @user = User.new
      @user.errors[:base] = "Bad username or password"
      render :new
    end
  end 
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
 
end
