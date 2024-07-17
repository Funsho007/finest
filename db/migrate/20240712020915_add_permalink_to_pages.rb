class AddPermalinkToPages < ActiveRecord::Migration[7.1]
  def change
    add_column :pages, :permalink, :string
  end
end
