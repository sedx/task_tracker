require 'rails_helper'

RSpec.describe User, type: :model do
  context 'invalid user' do

    before do
      @user = User.new
    end

    it 'should have error when hasnt name' do
      @user.name= ''
      @user.save
      expect(@user).to have(1).errors_on(:name)
    end

    it 'should have error when length min 2' do
      @user.name = 'I'
      @user.save
      expect(@user).to have(1).errors_on(:name)
    end
  end
end
