ActiveAdmin.register FeeCategory do
  permit_params :institute_id, :name, :description, :is_optional_to_student, :is_concesion, :billing_term, :active

  # config.batch_actions = false
  # actions :all, :except => [:new, :destroy, :edit]

  filter :id
  filter :institute
  filter :name
  filter :billing_term
  filter :is_concesion
  filter :is_optional_to_student
  filter :active
  filter :created_at

  index do
    selectable_column
    id_column
    column :institute
    column :name
    column :billing_term
    column :is_concesion
    column :is_optional_to_student
    column :active
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :institute
      row :name
      row :description
      row :billing_term
      row :is_concesion
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
      f.input :name
      f.input :description
      f.input :billing_term
      f.input :is_concesion
      f.input :is_optional_to_student
      f.input :active
    end
    f.actions
  end
end
