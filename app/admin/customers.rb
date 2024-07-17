ActiveAdmin.register Customer do
  config.filters = false

  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :primary_address, :alt_address, :primary_city, :alt_city, :primary_postal_code, :alt_postal_code, :primary_province_id, :alt_province_id

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :primary_address
    column :primary_city
    column :primary_postal_code
    column :primary_province
    column :alt_address
    column :alt_city
    column :alt_postal_code
    column :alt_province
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :primary_address
      f.input :primary_city
      f.input :primary_postal_code
      f.input :primary_province
      f.input :alt_address
      f.input :alt_city
      f.input :alt_postal_code
      f.input :alt_province
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :primary_address
      row :primary_city
      row :primary_postal_code
      row :primary_province
      row :alt_address
      row :alt_city
      row :alt_postal_code
      row :alt_province
    end
    active_admin_comments
  end

end
