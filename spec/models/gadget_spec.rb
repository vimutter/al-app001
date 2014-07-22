require 'rails_helper'

RSpec.describe Gadget, :type => :model do
  it { should belong_to :user }

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).scoped_to :user_id }
    it { should ensure_length_of(:name).is_at_most 250 }
    it { should validate_presence_of :description }
    it { should ensure_length_of(:description).is_at_most 1000 }
    it { should validate_presence_of :user }
  end
end
