require 'rails_helper'

RSpec.describe Gadget, :type => :model do
  it { should belong_to :user }

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :user }
    it { should validate_uniqueness_of :name, scope: :user_id }
  end
end
