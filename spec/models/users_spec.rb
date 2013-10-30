require 'spec_helper'
require 'faker'

#shoulda matchers gem
describe User do
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }
  it { should allow_value("a@b.com").for(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_confirmation) }
  it { should have_secure_password }
  it { should ensure_length_of(:password).is_at_least(6).with_short_message(/Password needs to be at least 6 characters/) }
end
