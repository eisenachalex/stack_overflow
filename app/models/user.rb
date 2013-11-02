class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :password, :password_confirmation, :website, :photo, :current_city, :interests, :name

  validates :email, :presence =>true,
                    :uniqueness=>true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, on: :create

  validates :password, :presence =>true, on: :create
  validates :password, length: { minimum: 6 , message: "Password needs to be at least 6 characters" }, on: :create
  validates_confirmation_of :password, on: :create
  validates :password_confirmation, presence: true, on: :create 


  has_many :questions
  has_many :answers
  has_many :comments
  has_many :badges

  has_one :photo

  has_secure_password
end
