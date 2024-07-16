ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :price, :stock
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :stock]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  ActiveAdmin.register Product do
    permit_params :name, :description, :price, :stock

    index do
      selectable_column
      id_column
      column :name
      column :description
      column :price
      column :stock
      actions
    end

    form do |f|
      f.inputs do
        f.input :name
        f.input :description
        f.input :price
        f.input :stock
      end
      f.actions
    end

    show do
      attributes_table do
        row :name
        row :description
        row :price
        row :stock
      end
    end
  end

end
