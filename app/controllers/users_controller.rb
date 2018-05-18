class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]

  # GET /users/:id
  def show
     @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/:id/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.business = current_business
    if @user.save
      redirect_to root_url, notice: "Welcome, #{@user.first_name} #{@user.last_name}"
    else
      render 'new'
    end
  end

  # PUT /users/:id
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, notice: "User profile #{@user.first_name} #{@user.last_name} has been successfully updated"
    else
      render 'edit'
    end
  end

  # DELETE /users/:id
  def destroy
    @user = Users.find_by(id: params[:id])
    if @user.try(:destroy)
      redirect_to @user, notice: "User profile #{@user.first_name} #{@user.last_name} has been successfully deleted"
    else
      redirect_to @user, alert: "Failed to delete user #{@user.first_name} #{@user.last_name}"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
