require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/profile.jpg")
    fill_in 'Caption', with: 'Why you suits?! #interviewtime'
    click_button 'Create Post'
    expect(page).to have_content('#interviewtime')
    expect(page).to have_css("img[src*='profile.jpg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'Why you suits?! #interviewtime'
    click_button 'Create Post'
    expect(page).to have_content("Halt, you fiend! You need an image to post here!")
  end
end
