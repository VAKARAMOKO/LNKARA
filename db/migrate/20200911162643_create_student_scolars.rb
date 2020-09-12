class CreateStudentScolars < ActiveRecord::Migration[6.0]
  def change
    create_table :student_scolars do |t|
      t.string :total
      t.string :status
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
