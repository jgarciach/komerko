class AddAttachmentPictureToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.has_attached_file :picture
    end
  end

  def self.down
    drop_attached_file :items, :picture
  end
end
