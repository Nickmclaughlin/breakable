require 'rails_helper'

describe Nudge do
  describe 'validations' do
    it { should validate_presence_of(:nudger_id) }
    it { should validate_presence_of(:recipient_id) }
  end

  describe 'associations' do
    it { should belong_to(:nudger) }
    it { should belong_to(:recipient) }
  end
end
