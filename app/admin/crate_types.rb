ActiveAdmin.register CrateType do
  permit_params :name, :description, :price

  index do
    selectable_column
    id_column
    column :name
    column :price do |crate|
      number_to_currency(crate.price)
    end
    column :created_at
    actions
  end

  filter :name
  filter :price
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price, step: :any
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :price do |crate|
        number_to_currency(crate.price)
      end
      row :created_at
      row :updated_at
    end
  end
end
