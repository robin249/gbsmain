ActiveAdmin.register Student do
  permit_params :sclass_id, :first_name, :middle_name, :last_name, :roll_number, :phone_number, :emergency_number, :email, :father_name, :mother_name, :permanent_address, :residential_address, :active

  # config.batch_actions = false
  # actions :all, :except => [:new, :destroy, :edit]

  filter :id
  filter :sclass
  filter :first_name
  filter :roll_number
  filter :phone_number
  filter :email
  filter :father_name
  filter :mother_name
  filter :active
  filter :created_at

  index do
    selectable_column
    id_column
    column :sclass
    column :first_name
    column :roll_number
    column :phone_number
    column :email
    column :roll_number
    column :father_name
    column :mother_name
    column :active
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :sclass
      row :first_name
      row :middle_name
      row :last_name
      row :roll_number
      row :phone_number
      row :emergency_number
      row :email
      row :father_name
      row :mother_name
      row :permanent_address
      row :residential_address
      row :active
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :sclass
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :roll_number
      f.input :phone_number
      f.input :roll_number
      f.input :emergency_number
      f.input :email
      f.input :father_name
      f.input :mother_name
      f.input :permanent_address
      f.input :residential_address
      f.input :active
    end
    f.actions
  end
end
