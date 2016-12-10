require 'rails_helper'

describe "creating jobs" do

  before do
    visit "/"
    click_link "New Job"
  end

  scenario "create a job with valid details" do
    fill_in "Title", with: "title"
    fill_in "Description", with: "his is a good job"

    click_button "Post"
    expect(page).to have_content "Job has been created."
  end
end
