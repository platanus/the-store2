ActiveAdmin.register Item do
  permit_params :name, :price, :image

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :image_url
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :image, as: :file
    end
    f.actions
  end
end
