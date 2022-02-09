class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :memo
      t.boolean :paper, null: false, default: true

      t.timestamps
    end
  end
end
