require 'spec_helper'


describe Question do
  it { should validate_presence_of(:q_title) }
  it { should validate_presence_of(:q_content) }
  it { should belong_to(:user) }
  # it { should have_many(:tags) }
  # it { should have_many(:answers) }
end
