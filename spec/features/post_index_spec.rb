require 'rails_helper'

feature 'Index displays a list of posts' do
  before do
    user = create(:user)
    sign_in_with user
    post_one = create(:post, user_id: user.id, caption: "This is post one")
    post_two = create(:post, user_id: user.id, caption: "This is the second post")
  end

  scenario 'the index displays correct created post information' do

    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='profile']")
  end
end
