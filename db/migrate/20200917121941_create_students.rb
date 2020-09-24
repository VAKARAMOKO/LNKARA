class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :contact
      t.string :mat_nat
      t.string :mat_school
      t.string :slug
      t.references :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
