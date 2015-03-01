require 'rails_helper'

RSpec.describe User, type: :model do

  context 'invalid user' do
    before do
      @user = build(:user)
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

  context 'valid_user' do
    before do
      @user = create(:user)
      @user.projects = [build(:project)]
      @user.save
      @user_without_projects = create(:user)
      @admin = create(:admin)
      @admin.projects = [build(:project)]
      @admin.save
    end
    it '#available_projects should return all projects for admin' do
      expect(@admin.available_projects.length).to eq(2)
    end

    it '#available_projects should return assigned projects for user' do
      expect(@user.available_projects.length).to eq(1)
      expect(@user_without_projects.available_projects.length).to eq(0)
    end

  end
end
