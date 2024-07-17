ActiveAdmin.register Tag do
  config.filters = false

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name

  form do |f|
    f.inputs 'Tag Details' do
      f.input :name
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  show do
    attributes_table do
      row :name
    end
    active_admin_comments
  end
end
