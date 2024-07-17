ActiveAdmin.register OrderItem do
  config.filters = false

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :product_id, :order_id, :quantity, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:product_id, :order_id, :quantity, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :product
    column :order
    column :quantity
    column :price
    actions
  end

  show do
    attributes_table do
      row :id
      row :product
      row :order
      row :quantity
      row :price
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :product
      f.input :order
      f.input :quantity
      f.input :price
    end
    f.actions
  end
end
