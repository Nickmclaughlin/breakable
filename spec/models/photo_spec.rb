require 'rails_helper'

describe Photo do
  describe 'validations' do
    it { should validate_presence_of(:photo) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
