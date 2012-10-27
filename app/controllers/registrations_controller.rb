class RegistrationsController < Devise::RegistrationsController

  # Override Devise to send json response on create.
  # POST /users
  # POST /users.json
  def create
    puts 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    puts params
    respond_to do |format|
      format.html {
        super
      }
      format.json {
        build_resource
        if resource.save
          @user = resource
          render "users/session", success: true, status: :created
        else
          render json: resource.errors, status: :unprocessable_entity
        end
      }
    end
  end

  # Override Devise to use update_without_password instead of update_with_password.
  # PUT /users
  # PUT /users.json?auth_token=secret
  def update
    puts 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    puts params
    respond_to do |format|
      format.html {
        self.resource = resource_class.to_adapter.get!(send(:"current_user").to_key)
        if resource.update_without_password(params[resource_name])
          set_flash_message :notice, :updated
          sign_in resource_name, resource, bypass: true
          respond_with resource, location: user_path(resource.authentication_token)
        else
          clean_up_passwords(resource)
          respond_with resource
        end
      }
      format.json {
        self.resource = resource_class.find_by_authentication_token(params[:auth_token])
        if resource.update_without_password(params[resource_name])
          head :no_content
        else
          clean_up_passwords(resource)
          render json: resource.errors, status: :unprocessable_entity
        end
      }
    end
  end
end
