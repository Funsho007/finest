ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock, :category_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock
      f.input :category
    end
    f.actions
  end
end
