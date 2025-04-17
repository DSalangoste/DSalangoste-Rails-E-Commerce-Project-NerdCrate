ActiveAdmin.register Order do
  permit_params :user_id, :crate_type_id, :status, :total_price, 
                :shipping_address, :payment_status, :tracking_number,
                :email, :phone

  index do
    selectable_column
    id_column
    column :user
    column :crate_type
    column :status
    column :total_price
    column :payment_status
    column :created_at
    actions
  end

  filter :user
  filter :crate_type
  filter :status
  filter :payment_status
  filter :created_at

  show do
    attributes_table do
      row :id
      row :user
      row :crate_type
      row :status
      row :total_price
      row :shipping_address
      row :payment_status
      row :tracking_number
      row :email
      row :phone
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :crate_type
      f.input :status
      f.input :total_price
      f.input :shipping_address
      f.input :payment_status
      f.input :tracking_number
      f.input :email
      f.input :phone
    end
    f.actions
  end
end 