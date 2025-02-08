# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  
  private

  def respond_with(resource, options = {})
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up successfully'},
        data: ::UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: { message: "User couldn't be created successfully",
         errors: resource.errors.full_messages.to_sentence }
      }, status: :unprocessable_entity
    end
  end
end
