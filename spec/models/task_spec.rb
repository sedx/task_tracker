require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'invalid task' do
    before do
      @task = build(:task)
    end
    it 'save task without name should return error' do
      @task.title = nil
      @task.save
      expect(@task).to have(1).error_on(:title)
    end

    it 'save task with short name should return error' do
      @task.title = 'D'
      @task.save
      expect(@task).to have(1).error_on(:title)
    end
  end
end
