class AddAttachmentAvatarToArticles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :articles do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :articles, :avatar
  end
end
