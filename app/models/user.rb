class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :password, :password_confirmation, :website

  validates :email, :presence =>true,
                    :uniqueness=>true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, on: :create
  validates :password, :presence =>true
  validates :password, length: { minimum: 6 , message: "Password needs to be at least 6 characters" }
  validates_confirmation_of :password
  validates :password_confirmation, presence: true

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :badges
  has_one :picture

  has_secure_password
end
