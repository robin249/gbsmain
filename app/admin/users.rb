ActiveAdmin.register User, as: 'Admin Users' do
  menu parent: 'Users', priority: 1
  permit_params :institute_id, :email, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :institute
    column :email
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :institute
  filter :email
  filter :role, as: :select, collection: User::ROLES
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :institute
      f.input :email
      f.input :role, as: :select, collection: User::ROLES
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
