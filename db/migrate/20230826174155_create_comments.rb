class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.belongs_to :book, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
