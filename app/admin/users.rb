ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :email, :username, :password_hash, :confirmed_at, :confirmation_token, :confirmation_sent_at, :unconfirmed_email
  #
  # or
  #
  # permit_params do
  #   permitted = [:encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :email, :username, :password_hash, :confirmed_at, :confirmation_token, :confirmation_sent_at, :unconfirmed_email]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
