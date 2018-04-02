class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      #same as redirect_to user_url(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
