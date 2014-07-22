require 'rails_helper'

RSpec.describe Gadget, :type => :model do
  it { should belong_to :user }

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).scoped_to :user_id }
    it { should ensure_length_of(:name).is_at_most 250 }
    it { should validate_presence_of :description }
    it { should ensure_length_of(:description).is_at_most 1000 }
    it { should validate_presence_of :user_id }
  end

  describe '#for_user' do
    let(:user) { double(:user, id: 1) }

    it 'should return gadgets by user', slow: true do
      one = Gadget.create name: 'test1', description: '1', user_id: 1
      two = Gadget.create name: 'test2', description: '2', user_id: 2
      expect(Gadget.for_user(user).to_a).to eql([one])
    end
  end
end
