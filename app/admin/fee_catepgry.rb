ActiveAdmin.register FeeCategory do
  permit_params :name, :description, :billing_term, :active

  # config.batch_actions = false
  # actions :all, :except => [:new, :destroy, :edit]

  filter :id
  filter :name
  filter :billing_term
  filter :active
  filter :created_at

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :billing_term
    column :active
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :billing_term
      row :active
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :billing_term
      f.input :active
    end
    f.actions
  end
end
