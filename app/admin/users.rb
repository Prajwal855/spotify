ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :firstname, :lastname, :age, :gender, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :jti
  #
  # or
  #
  # permit_params do
  #   permitted = [:firstname, :lastname, :age, :gender, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :jti]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :firstname, :lastname, :age, :gender, :email, :image

  form do|f|
    f.input :email
    f.input :firstname
    f.input :image, as: :file
    f.actions
  end
  
end
