require 'rails_helper'

RSpec.describe "projects/index.html.slim", type: :view do
  it 'should display "create project" message if count of project 0
      and user is admin' do
    assign(:projects,nil)
    controller.stub(:current_user).and_return(build(:admin))
    render
    expect(rendered).to include("Создайте проект")
  end

  it 'it should display mesage for user' do
    assign(:projects, nil)
    controller.stub(:current_user).and_return(build(:user))
    render
    expect(rendered).to include("Обратитесь к администратору")
  end
end
