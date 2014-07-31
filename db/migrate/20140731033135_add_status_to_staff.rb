class AddStatusToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :status, :boolean, default: false
  end
end
