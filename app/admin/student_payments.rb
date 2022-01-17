ActiveAdmin.register StudentPayment do
  permit_params :institute_id, :sclass_id, :name, :code, :description, :is_optional_to_student, :active

  config.batch_actions = false
  actions :all, :except => [:new, :destroy, :edit]

  filter :id
  filter :sclass
  filter :student
  filter :total_amount
  filter :session_duration
  filter :session_year
  filter :status
  filter :payment_mode
  filter :created_at

  index do
    selectable_column
    id_column
    column :sclass
    column :student
    column :total_amount
    column :payment_mode
    column :status
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :sclass
      row :student
      row :total_amount
      row :payment_mode
      row :status
      row :session_duration
      row :session_year
      row :remarks
      row :created_at
      row :updated_at
      row :created_by
      row :updated_by


      div class: "fee panel" do
        h3 do
          "Student Payment Detail (#{student_payment.student_payment_details.count})"
        end
        div class: "panel_contents" do
          if student_payment.student_payment_details.any?
            student_payment.student_payment_details.order(created_at: :asc).each do |student_payment_detail|
              student_fee = student_payment_detail.student_fee
              div class: "control-group", style: "display: flex; margin-top: 20px;" do
                div class: "form-group", style: "display: grid; width: 20%;" do
                  label class: "label", style: "float: left; font-weight: bold; color: #5E6469;" do
                    'Fee Category' + (student_fee.fee_category.is_optional_to_student? ? " (Optional)" : '')
                  end
                  label class: "label" do
                    student_fee.fee_category.name
                  end
                end
                div class: "form-group", style: "display: grid; width: 20%;" do
                  label class: "label", style: "float: left; font-weight: bold; color: #5E6469;" do
                    'Session'
                  end
                  label class: "label" do
                    "#{student_fee.session_duration} (#{student_fee.session_year})"
                  end
                end
                div class: "form-group", style: "display: grid; width: 10%;" do
                  label class: "label", style: "width: 20%; float: left; font-weight: bold; color: #5E6469;" do
                    'Fee '
                  end
                  label class: "label" do
                    "#{student_fee.amount} * #{student_fee.total_months}"
                  end
                end
                div class: "form-group", style: "display: grid; width: 10%;" do
                  label class: "label", style: "width: 20%; float: left; font-weight: bold; color: #5E6469;" do
                    'Concession '
                  end
                  label class: "label" do
                    "#{student_fee.concession} * #{student_fee.total_months}"
                  end
                end
                div class: "form-group", style: "display: grid; width: 15%;" do
                  label class: "label", style: "width: 20%; float: left; font-weight: bold; color: #5E6469;" do
                    'Balance '
                  end
                  label class: "label" do
                    student_fee.fee_category_balance
                  end
                end
                div class: "form-group", style: "display: grid; width: 10%;" do
                  label class: "label", style: "float: left; font-weight: bold; color: #5E6469;" do
                    'Fee paid '
                  end
                  label class: "label" do
                    student_payment_detail.amount
                  end
                end
                div class: "form-group", style: "display: grid; width: 15%;" do
                  label class: "label", style: "width: 20%; float: left; font-weight: bold; color: #5E6469;" do
                    'Remarks '
                  end
                  label class: "label" do
                    student_payment_detail.remarks
                  end
                end
              end
              div do
                hr
                br
              end
            end
          end
        end
      end

    end
  end
end
