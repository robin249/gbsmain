ActiveAdmin.register User, as: 'Teachers' do
  menu parent: 'Users', priority: 2
  permit_params :institute_id, :first_name, :last_name, :email, :password, :password_confirmation, :role


  controller do
    def scoped_collection
      User.where(role: 'teacher')
    end
  end

  index do
    selectable_column
    id_column
    column :institute
    column :first_name
    column :last_name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :institute
  filter :first_name
  filter :last_name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :institute
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :role, as: :select, collection: User::TEACHER_ROLE, :input_html => { disabled:true }
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
