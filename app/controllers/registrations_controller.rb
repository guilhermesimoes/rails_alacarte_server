class RegistrationsController < Devise::RegistrationsController

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
          response = resource
          response[:auth_token] = resource.authentication_token
          render json: response.to_json, success: true, status: :created
        else
          render json: resource.errors, status: :unprocessable_entity
        end
      }
    end
  end
end
