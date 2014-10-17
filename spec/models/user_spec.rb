require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:sex) }
    it { should validate_presence_of(:zip) }
  end

  describe 'associations' do
    it { should have_many(:received_posts) }
    it { should have_many(:sent_posts) }
    it { should have_many(:photos) }
    it { should have_many(:received_responses) }
    it { should have_many(:sent_responses) }
    it { should have_many(:received_nudges) }
    it { should have_many(:sent_nudges) }
  end
end
