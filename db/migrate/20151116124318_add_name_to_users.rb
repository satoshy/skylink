class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username,   :string, null: false, unique: true, default: ""
    add_index  :users, :username,   unique: true
    add_column :users, :first_name, :string, default: ""
    add_column :users, :last_name,  :string, default: ""
    add_column :users, :birthdate,  :date
    add_column :users, :phone,      :string, default: ""
  end
end
