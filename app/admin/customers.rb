ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  # Disable filters to avoid ransack issues
  config.filters = false

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address do |customer|
      customer.email_address.present? ? customer.email_address : "No email"
    end
    column :notes do |customer|
      customer.notes.present? ? truncate(customer.notes, length: 50) : "No notes"
    end
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name, label: "Full Name", placeholder: "Enter customer's full name"
      f.input :phone_number, label: "Phone Number", placeholder: "(555) 123-4567"
      f.input :email_address, label: "Email Address", placeholder: "customer@email.com (optional)"
      f.input :notes, label: "Notes", as: :text, rows: 4, placeholder: "Additional notes about the customer"
      f.input :image, label: "Profile Image", as: :file, hint: "Upload a profile image for the customer"
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address do |customer|
        customer.email_address.present? ? customer.email_address : "No email address"
      end
      row :notes do |customer|
        customer.notes.present? ? simple_format(customer.notes) : "No notes"
      end
      row :image do |customer|
        if customer.image.attached?
          image_tag customer.image, style: "max-width: 300px;"
        else
          "No image uploaded"
        end
      end
      row :created_at
      row :updated_at
    end
  end
end