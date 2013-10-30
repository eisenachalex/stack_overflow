class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :password, :password_confirmation, :website

  validates :email, :presence =>true,
                    :uniqueness=>true
  # validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, on: :create

  validates :password, :presence =>true, length: { minimum: 6 }
  validates_confirmation_of :password
  validates :password_confirmation, presence: true

  has_secure_password
end
