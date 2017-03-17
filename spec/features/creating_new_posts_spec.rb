require 'rails_helper.rb'

feature 'Creating posts' do
  background do
    user = create(:user)
    sign_in_with user
    post = create(:post, user_id: user.id, caption: "Why you suits?! #interviewtime")

  end

  scenario 'can create a post' do
    visit '/'
    expect(page).to have_content('#interviewtime')
    expect(page).to have_css("img[src*='profile.jpg']")
    expect(page).to have_content('Arnie')

  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'post_caption', with: 'Why you suits?! #interviewtime'
    click_button 'Create Post'
    expect(page).to have_content("Halt, you fiend! You need an image to post here!")
  end
end
