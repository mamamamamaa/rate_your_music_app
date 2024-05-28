# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation).tap do |user_params|
    end
  end

  def after_sign_up_path_for(resource)
    resource.create_profile unless resource.profile
    super
  end
end
