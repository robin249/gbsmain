ActiveAdmin.register Subject do
  permit_params :institute_id, :sclass_id, :name, :code, :description, :is_optional_to_student, :active

  # config.batch_actions = false
  # actions :all, :except => [:new, :destroy, :edit]

  filter :id
  filter :institute
  filter :sclass
  filter :name
  filter :code
  filter :is_optional_to_student
  filter :active
  filter :created_at

  index do
    selectable_column
    id_column
    column :institute
    column :sclass
    column :name
    column :code
    column :is_optional_to_student
    column :active
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :institute
      row :sclass
      row :name
      row :code
      row :description
      row :is_optional_to_student
      row :active
      row :created_at
      row :updated_at
      row :created_by
      row :updated_by
    end
  end

  form do |f|
    f.inputs do
      f.input :institute
      f.input :sclass
      f.input :name
      f.input :code
      f.input :description
      f.input :is_optional_to_student
      f.input :active
    end
    f.actions
  end
end
