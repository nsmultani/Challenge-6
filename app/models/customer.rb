class Customer < ApplicationRecord
  has_one_attached :image
 
  validates :full_name, presence: true
  validates :phone_number, presence: true
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  # Add ransackable attributes for ActiveAdmin search
  def self.ransackable_attributes(auth_object = nil)
    ["full_name", "phone_number", "email_address", "notes", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end
end