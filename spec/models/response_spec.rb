require 'rails_helper'

describe Response do
  describe 'associations' do
    it { should belong_to(:poster) }
    it { should belong_to(:recipient) }
    it { should belong_to(:post) }
  end

  describe 'validations' do
    it { should validate_presence_of(:poster_id) }
    it { should validate_presence_of(:recipient_id) }
    it { should validate_presence_of(:body) }
  end
end
