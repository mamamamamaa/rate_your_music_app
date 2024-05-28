class User < ApplicationRecord
  has_many :reviews, foreign_key: "review_by_id"
  has_one :profile
  after_create :create_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def create_profile
    Profile.create(user: self)
  end
end
