class AddOurBackgroundsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ourbackground, :string
  end
end
