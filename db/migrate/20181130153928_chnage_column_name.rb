class ChnageColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :heroine_powers, :heoine_id, :heroine_id

  end
end
