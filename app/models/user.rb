class User < ApplicationRecord
  has_many :reviews, foreign_key: "review_by_id"
  has_one :profile
  after_create :create_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def create_profile
    Profile.create(user: self)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "email", "encrypted_password", "id", "id_value", "password_hash", "remember_created_at", "reset_password_sent_at", "reset_password_token", "unconfirmed_email", "updated_at", "username"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["profile", "reviews"]
  end
end
