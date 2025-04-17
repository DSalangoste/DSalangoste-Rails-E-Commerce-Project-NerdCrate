ActiveAdmin.register CrateType do
  permit_params :name, :description, :price, :image

  index do
    selectable_column
    id_column
    column "Preview" do |crate|
      if crate.image.attached?
        image_tag url_for(crate.image), size: '50x50'
      else
        "No image"
      end
    end
    column :name
    column :description
    column :price do |crate|
      number_to_currency(crate.price)
    end
    column :created_at
    actions
  end

  filter :name
  filter :price
  filter :created_at

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :price do |crate|
        number_to_currency(crate.price)
      end
      row :image do |crate|
        if crate.image.attached?
          image_tag url_for(crate.image), style: 'max-width: 300px'
        else
          "No image"
        end
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Crate Type Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :image, as: :file
    end
    f.actions
  end
end 