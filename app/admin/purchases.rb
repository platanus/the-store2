ActiveAdmin.register Purchase do
  permit_params :status

  includes :item, :user

  index do
    selectable_column
    id_column
    column :item
    column :user
    tag_column :status
    actions
  end

  form do |f|
    f.inputs do
      f.input :status
    end
    f.actions
  end
end
