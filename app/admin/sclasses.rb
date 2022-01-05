ActiveAdmin.register Sclass do
  menu label: 'Classes'
  permit_params :institute_id, :name, :description, :session_duration, :active

  # config.batch_actions = false
  # actions :all, :except => [:new, :destroy, :edit]

  filter :id
  filter :institute
  filter :name
  filter :active
  filter :session_duration
  filter :created_at

  index do
    selectable_column
    id_column
    column :institute
    column :name
    column :subjects
    column :session_duration
    column :active
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :institute
      f.input :name
      f.input :description
      f.input :session_duration
      f.input :active
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :institute
      row :name
      row :description
      row :session_duration
      row :active
      row :subjects
      row :created_at
      row :updated_at
      row :created_by
      row :updated_by

      div class: "fee panel" do
        h3 "Class Fee (#{sclass.class_fees.count})"
        div class: "panel_contents" do
          form class: 'add_fees', action: "/admin/sclasses/add_fees", enctype: 'multipart/form-data', method: 'post', style: "width: 50%; margin-top: 20px;" do |f|
            f.input :name => 'authenticity_token', :type => :hidden, :value => form_authenticity_token.to_s
            f.input :id, type: :hidden, name: :id, value: params[:id]
            if sclass.class_fees.any?
              sclass.class_fees.order(created_at: :asc).each do |class_fee|
                div class: "control-group", style: "display: flex;" do
                  div class: "form-group", style: "display: grid; width: 50%;" do
                    label class: "label", style: "float: left; font-weight: bold; color: #5E6469;" do
                      'Fee Category' + (class_fee.fee_category.is_optional_to_student? ? " (Optional for Student)" : '')
                    end
                    label class: "label" do
                      class_fee.fee_category.name
                    end
                  end
                  div class: "form-group", style: "display: grid; width: 40%;" do
                    label class: "label", style: "width: 20%; float: left; font-weight: bold; color: #5E6469;" do
                      'Amount '
                    end
                    input type: "text", name: "amount[#{class_fee.id}]", value: class_fee.amount
                  end
                  div class: "form-group", style: "display: inline-flex; width: 30%; margin-top: 20px;" do
                    input type: "checkbox", name: "active[#{class_fee.id}]", value: 1, checked: class_fee.active
                    label class: "label", style: "padding-left: 5px;" do
                      ' Active'
                    end
                  end
                end
                div do
                  hr
                  br
                end
              end
            end
            f.input type: :submit, value: 'Add Fee'
          end
        end
      end

    end
  end

  collection_action :add_fees, method: :post do
    @sclass = Sclass.find_by_id(params[:id])
    if params[:amount].present?
      params[:amount].each do |key, value|
        @class_fee = ClassFee.find_by_id(key)
        @class_fee.update(amount: value, active: (params[:active].present? && params[:active][key].present?) ? 1 : 0) if @class_fee.present?
      end
    end
    # ClassFee.create!(document_id: params[:student]['document_id'], attachments: params[:student][:attachments], student: @student)
    redirect_to admin_sclass_path(@sclass), notice: "Fee has been added successfully."
  end

  action_item :add_student_fee, only: :show do
    sclass = Sclass.find(params[:id])
    link_to('Add Students Fee', add_student_fee_admin_sclass_path(params[:id]), data: {confirm: "Do you want to add students fee for this class?"})
  end

  member_action :add_student_fee do
    sclass = Sclass.find_by_id(params[:id])
    class_fees = sclass.class_fees
    students = sclass.students
    class_fees.any? && class_fees.each do |class_fee|
      fee_category_id = class_fee.fee_category.id
      students.any? && students.each do |student|
        student_fee = StudentFee.where(sclass_id: params[:id], student_id: student.id, fee_category_id: fee_category_id).first_or_initialize
        student_fee.amount = class_fee.amount
        student_fee.active = class_fee.active
        student_fee.session_duration = sclass.session_duration
        student_fee.session_year = '2020-2021'
        student_fee.save!
      end
    end

    redirect_to admin_sclass_path(sclass), notice: "Student Fee has been added successfully."
  end

  action_item :add_student_subjects, only: :show do
    sclass = Sclass.find(params[:id])
    link_to('Add Subjects for Students', add_student_subjects_admin_sclass_path(params[:id]), data: {confirm: "Do you want to add all subjects to the students for this class?"})
  end

  member_action :add_student_subjects do
    sclass = Sclass.find_by_id(params[:id])
    subjects = sclass.subjects
    students = sclass.students
    subjects.any? && subjects.each do |subject|
      students.any? && students.each do |student|
        student_subject = StudentSubject.where(sclass_id: params[:id], student_id: student.id, subject_id: subject.id).first_or_initialize
        student_subject.active = !subject.is_optional_to_student
        student_subject.session_duration = sclass.session_duration
        student_subject.session_year = '2020-2021'
        student_subject.save!
      end
    end

    redirect_to admin_sclass_path(sclass), notice: "Subjects has been added for students successfully."
  end
end
