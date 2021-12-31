ActiveAdmin.register Institute do
  permit_params :name, :description, :active

  # config.batch_actions = false
  # actions :all, :except => [:new, :destroy, :edit]

  filter :id
  filter :name
  filter :active
  filter :created_at

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :active
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :active
      row :created_at
      row :updated_at
      row :created_by
      row :updated_by
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :active
    end
    f.actions
  end
end
