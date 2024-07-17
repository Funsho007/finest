ActiveAdmin.register Order do
  permit_params :user_id, :status

  index do
    selectable_column
    id_column
    column :user
    column :status
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :status
    end
    f.actions
  end

  show do
    attributes_table do
      row :user
      row :status
      row :created_at
      row :updated_at
    end

    panel "Order Items" do
      table_for order.order_items do
        column :product
        column :quantity
        column :price
      end
    end

    active_admin_comments
  end
end
