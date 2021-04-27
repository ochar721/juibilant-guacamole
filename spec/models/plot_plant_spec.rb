require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it { should belong_to(:plot) }
    it { should belong_to(:plant) }
    it { should have_many(:gardens).through(:plot) }
  end
end
