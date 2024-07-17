ActiveAdmin.register Page do
  config.filters = false

  permit_params :title, :content, :permalink

  index do
    selectable_column
    id_column
    column :title
    column :permalink
    column :content do |page|
      truncate(page.content, length: 100)
    end
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :permalink
      f.input :content
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :permalink
      row :content do |page|
        raw page.content
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
