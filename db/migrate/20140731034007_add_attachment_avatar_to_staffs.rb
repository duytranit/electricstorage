class AddAttachmentAvatarToStaffs < ActiveRecord::Migration
  def self.up
    change_table :staffs do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :staffs, :avatar
  end
end
