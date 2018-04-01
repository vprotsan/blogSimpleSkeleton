class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }

  # validates :avatar, attachment_presence: true
  # validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 2.megabytes
  has_attached_file :avatar, :styles => { :large =>"800×600>", :medium =>"600×400>", :thumb=>"100x100>" }
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end

# Also, the generator accepts column type as references (also available as belongs_to). For instance:
# rails generate migration AddUserRefToProducts user:references
# class AddUserRefToProducts < ActiveRecord::Migration[5.0]
#   def change
#     add_reference :products, :user, foreign_key: true
#   end
# end
