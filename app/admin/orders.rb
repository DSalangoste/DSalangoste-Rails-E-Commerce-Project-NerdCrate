ActiveAdmin.register Order do
  permit_params :status, :total_price, :user_id

  index do
    selectable_column
    id_column
    column :user
    column :status
    column :total_price
    column :created_at
    actions
  end

  filter :user
  filter :status
  filter :total_price
  filter :created_at

  show do
    attributes_table do
      row :id
      row :user
      row :status
      row :total_price
      row :created_at
      row :updated_at
    end

    panel "Ordered Crates" do
      table_for order.ordered_crates do
        column :crate_type
        column :status
        column :customization_options
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :status
      f.input :total_price
    end
    f.actions
  end
end 