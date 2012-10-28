class PasswordsController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update]

  # GET /change_password
  def edit
    @user = current_user
  end

  # PUT /update_password
  # PUT /update_password.json?auth_token=secret
  def update
    respond_to do |format|
      format.html {
        @user = User.find(current_user)
        if @user.update_with_password(params[:user])
          sign_in @user, bypass: true
          redirect_to user_path(@user.authentication_token), notice: 'Password was successfully updated.'
        else
          render action: "edit"
        end
      }
      format.json {
        @user = User.find_by_authentication_token(params[:auth_token])
        if @user.update_with_password(params[:user])
          # sign_in @user, bypass: true
          head :no_content
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      }
    end
  end
end
