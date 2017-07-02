class AddUserIdToBeacons < ActiveRecord::Migration
  def change
    add_column :beacons, :user_id, :integer
  end
end
