class AddBackgroundToUsers < ActiveRecord::Migration
  def change
    add_column :users, :background, :string
  end
end
