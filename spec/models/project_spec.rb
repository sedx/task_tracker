require 'rails_helper'

RSpec.describe Project, type: :model do
  before :each do
    @project = build(:project)
  end

  context 'invalid project' do
    it 'project should have name' do
      @project.name = nil
      @project.save
      expect(@project).to have(1).error_on(:name)
    end
  end

end
