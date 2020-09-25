class CreateStudentInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :student_invoices do |t|
      t.integer :solde
      t.integer :operation
      t.string :invoice
      t.string :status
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
