require 'spec_helper'

  describe Answer do
    it { should validate_presence_of(:a_content) }
    it { should belong_to(:user) }
    it { should belong_to(:question) }
    # it { should have_many(:comments)}
  end
