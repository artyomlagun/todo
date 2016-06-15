require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    context 'valid attributes' do
      it 'should be valid' do
        user = FactoryGirl.build(:user)
        expect(user).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'should be invalid lname' do
        user = FactoryGirl.build(:user, lname: '')
        expect(user).not_to be_valid
      end
      it 'should be invalid fname' do
        user = FactoryGirl.build(:user, fname: '')
        expect(user).not_to be_valid
      end
      it 'should be invalid email' do
        user = FactoryGirl.build(:user, email: '')
        expect(user).not_to be_valid
      end
      it 'should be uniqeness email' do
        user = FactoryGirl.create(:user)
        user_dup = user.dup

        expect(user_dup).not_to be_valid
      end
    end

    context 'display fullname' do
      it 'correct' do
        user = FactoryGirl.build(:user)
        expect(user.fullname).to eq("Lagun Artyom")
      end
    end
  end
end
