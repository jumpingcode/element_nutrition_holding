class User < ActiveRecord::Base
  has_many :referred_users, class_name: 'User', foreign_key: 'referrer_id'
  belongs_to :referrer, class_name: 'User'

  validates :email, presence: true, uniqueness: true
  validates :referral_code, presence: true
end
