class UsersController < ApplicationController
  def index
    users = User.all
    if users.empty?
      render json: {
        message: "Users Not Found",
        user:[]
      }, status: :not_found
    else
      render json: {
        message: "Users Found",
        users: users
      }, status: :ok
    end
  end

  def show
    user = set_user
    if user
      render json: {
        message: "User Found",
        user: user
      }, status: :ok
    else
      render json: {
        message: "Users Not Found",
        user:[]
      }, status: :not_found
    end
  end

  def create
    debugger
    user = User.new(user_params)
    if user.save
      render json: {
        message: "User Created Successfully",
        user: user
      }, status: :created
    else
      render json: {
        message: "User Was Unable to Create",
        errors: user.errors.full_messages
      }, status: 422
    end
  end

  def update
    user = set_user
    if user.update(user_params)
      render json: {
        message: "User Updated Successfully",
        user: user
      }, status: :ok
    else
      render json: {
        message: "User Not Updated",
        error: user.errors.full_messages
      }, status: :unprossessable_entity
    end
  end

  def destroy
    user = set_user
    if user.delete
      render json: {
        message: "User Deleted Successfully",
        user: user
      }, status: :ok
    else
      render json: {
        message: "User Unable To Delete",
        error: user.errors.full_messages
      }, status: :unprossessable_entity
    end
  end

  private
  def set_user
    user = User.find_by(id: params[:id])
    if user
      return user
    end
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :age, :gender, :image, :email, :password)
  end
end
