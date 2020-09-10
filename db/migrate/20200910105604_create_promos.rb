class CreatePromos < ActiveRecord::Migration[6.0]
  def change
    create_table :promos do |t|
      t.string :title
      t.string :slug
      t.string :code_school
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
