class ChangeDefaultColorOnUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :header_color, "#370617"
  end
end
