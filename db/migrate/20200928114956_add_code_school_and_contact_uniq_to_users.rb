class AddCodeSchoolAndContactUniqToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :contact, :string
    add_index :users, :contact, unique: true
    add_column :users, :code_school, :string
  end
end
