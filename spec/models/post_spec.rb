require 'rails_helper'

describe Post do
  describe 'validations' do
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:poster_id) }
    it { should validate_presence_of(:recipient_id) }
  end

  describe 'associations' do
    it { should belong_to(:poster) }
    it { should belong_to(:recipient) }
  end
end
