ActiveAdmin.register Review do
  permit_params :body, :rating

  includes :item, :user

  index do
    selectable_column
    id_column
    column :item
    column :user
    column :rating
    actions
  end

  form do |f|
    f.inputs do
      f.input :body
      f.input :rating
    end
    f.actions
  end
end
