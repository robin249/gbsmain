ActiveAdmin.register Document do
  permit_params :institute_id, :name, :description, :is_mandatory, :active

  # config.batch_actions = false
  # actions :all, :except => [:new, :destroy, :edit]

  filter :id
  filter :institute
  filter :name
  filter :is_mandatory
  filter :active
  filter :created_at

  index do
    selectable_column
    id_column
    column :institute
    column :name
    column :description
    column :is_mandatory
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
      row :is_mandatory
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
      f.input :is_mandatory
      f.input :active
    end
    f.actions
  end
end
