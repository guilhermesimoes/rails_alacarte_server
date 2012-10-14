class UsersController < ApplicationController
  respond_to :html, :json

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_with(@users)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end
end
