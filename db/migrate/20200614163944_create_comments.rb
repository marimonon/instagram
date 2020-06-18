class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :textcomment, foreign_key: true, null: false
      t.timestamps
    end
  end
end
