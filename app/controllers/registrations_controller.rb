class RegistrationsController < Devise::RegistrationsController

  # Override Devise to send json response on create.
  # POST /users
  # POST /users.json
  def create
    respond_to do |format|
      format.html {
        super
      }
      format.json {
        puts 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
        puts params
        build_resource
        if resource.save
          response = {}
          response[:auth_token] = resource.authentication_token
          render json: response.to_json, success: true, status: :created
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
    respond_to do |format|
      format.html {
        self.resource = resource_class.to_adapter.get!(send(:"current_user").to_key)
        if resource.update_without_password(params[resource_name])
          set_flash_message :notice, :updated
          sign_in resource_name, resource, bypass: true
          respond_with resource, location: user_path(resource)
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
