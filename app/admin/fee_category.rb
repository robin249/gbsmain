ActiveAdmin.register FeeCategory do
  permit_params :institute_id, :name, :description, :is_optional_to_student, :is_concesion, :billing_term, :active, :sclass_ids => []

  # config.batch_actions = false
  # actions :all, :except => [:new, :destroy, :edit]

  filter :id
  filter :institute
  filter :name
  filter :sclasses
  filter :billing_term
  filter :is_optional_to_student
  filter :active
  filter :created_at

  index do
    selectable_column
    id_column
    column :institute
    column :name
    column :sclasses
    column :billing_term
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
      row :sclasses
      row :description
      row :billing_term
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
      f.input :sclasses, as: :select, collection: Sclass.all, input_html: {:class => 'chosen-select', :multiple => true, :size => 20, :style => "width: 70%;"}
      f.input :description
      f.input :billing_term
      f.input :is_optional_to_student
      f.input :active
    end
    f.actions
  end
end
