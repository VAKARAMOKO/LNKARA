class DropStudentItemTables < ActiveRecord::Migration[6.0]
  def down
    table_exists?(:student_items) ? drop_table(:student_items) : nil
  end
end
