class ChangeColumnToPosts < ActiveRecord::Migration[6.0]
  # 変更内容
  def up
    change_column :posts, :contain, :string, null: false
  end

  # 変更前の状態
  def down
    change_column :posts, :contain, :string, null: true
  end
end
