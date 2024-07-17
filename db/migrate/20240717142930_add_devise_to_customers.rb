class AddDeviseToCustomers < ActiveRecord::Migration[7.1]
  def change
    change_table :customers do |t|
      # Only add the email column if it doesn't already exist
      t.string :encrypted_password, null: false, default: '' unless column_exists?(:customers, :encrypted_password)
      t.string :reset_password_token unless column_exists?(:customers, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:customers, :reset_password_sent_at)
      t.datetime :remember_created_at unless column_exists?(:customers, :remember_created_at)

      # Uncomment the following lines if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    add_index :customers, :reset_password_token, unique: true unless index_exists?(:customers, :reset_password_token)
    # If you want to use the confirmable module, uncomment the following lines
    # add_column :customers, :confirmation_token, :string
    # add_column :customers, :confirmed_at, :datetime
    # add_column :customers, :confirmation_sent_at, :datetime
    # add_index :customers, :confirmation_token, unique: true
  end
end
