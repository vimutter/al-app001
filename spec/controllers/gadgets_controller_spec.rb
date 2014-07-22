require 'rails_helper'

RSpec.describe GadgetsController, :type => :controller do

  describe '#index' do
    let(:user) { double(:user) }
    let(:gadget) { double(:gadget) }

    before(:each) do
      allow(controller).to receive(:current_user).and_return user
      expect(Gadget).to receive(:for_user).with(user).and_return [gadget]
    end

    it 'should render all users gadgets in list view' do
      get :index

      expect(assigns[:gadgets]).to eql [gadgets]
    end

    it 'should render all users gadgets in panels view' do
      get :index, panel: true

      expect(assigns[:panel]).to be_true
    end

    it 'should support pagination' do
      chain = double(:gadgets)
      expect(Gadget).to receive(:for_user).with(user).and_return chain
      expect(chain).to receive(:page).with(2).and_return chain
      expect(chain).to receive(:per).with(10).and_return [gadget]

      get :index, page: 2

      expect(assigns[:gadgets]).to eql [gadgets]
    end
  end
end
