ActiveAdmin.register Student do
  permit_params :institute_id, :sclass_id, :first_name, :middle_name, :last_name, :roll_number, :phone_number, :emergency_number, :email, :father_name, :mother_name, :permanent_address, :residential_address, :active

  # config.batch_actions = false
  # actions :all, :except => [:new, :destroy, :edit]

  filter :id
  filter :institute
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
    column :institute
    column :sclass
    column :first_name
    column :roll_number
    column :phone_number
    column :email
    column :father_name
    column :mother_name
    column :active
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :institute
      f.input :sclass
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :roll_number
      f.input :phone_number
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

  show do
    attributes_table do
      row :id
      row :institute
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
      row :created_by
      row :updated_by

      div class: "comments student panel" do
        h3 "Attachment Documents (#{student.student_documents.count})"
        div class: "panel_contents" do
          if student.student_documents.any?
            student.student_documents.order(created_at: :asc).each do |student_document|
              div class: "active_admin_comment" do
                div class: "active_admin_comment_meta" do
                  h4 class: "active_admin_comment_author" do
                    if student_document.document.present?
                      student_document.document.name
                    end
                  end
                  span do
                    student_document.created_at.strftime("%B %d, %Y %H:%M")
                  end
                end
                div class: "active_admin_comment_body" do
                  ul do
                    student_document.attachments.each do |attachment|
                      li do
                        link_to(attachment.identifier, attachment.url.to_s, { target: '_blank' })
                      end
                    end
                  end
                end
              end
            end

            div do
              hr
            end
          end


          form class: 'add_documents', multipart: true, action: "/admin/students/add_documents", enctype: 'multipart/form-data', method: 'post', style: "width: 50%; margin-top: 20px;" do |f|
            f.input :name => 'authenticity_token', :type => :hidden, :value => form_authenticity_token.to_s
            f.input :id, type: :hidden, name: :id, value: params[:id]
            label class: "label", style: "width: 20%; float: left; font-weight: bold; color: #5E6469;" do
              'Select Document: '
            end
            select name: 'student[document_id]', label: 'Select Document', :collection => content_tag(:option,'select one...',:value=>"")+options_from_collection_for_select(Document.active.order(created_at: :asc), 'id', 'name')
            div do
              br
            end
            label class: "label", style: "width: 20%; float: left; font-weight: bold; color: #5E6469;" do
              'Upload Attachment: '
            end
            input type: 'file', name: 'student[attachments][]', multiple: 'true'
            div do
              br
              br
            end
            f.input type: :submit, value: 'Add Document'
          end

        end
      end

    end
  end


  collection_action :add_documents, method: :post do
    @student = Student.find_by_id(params[:id])
    StudentDocument.create!(document_id: params[:student]['document_id'], attachments: params[:student][:attachments], student: @student)
    redirect_to admin_student_path(@student), notice:"Document has been added successfully."
  end
end
