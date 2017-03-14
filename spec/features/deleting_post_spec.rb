require 'rails_helper'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: 'Abs for days.')
    user = create(:user)
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'

    click_link(href: post_path(post))
    click_link 'Edit Post'
  end

  scenario 'Can delete a single post' do
    click_link 'Delete Post'

    expect(page).to have_content('Problem solved!  Post deleted.')
    expect(page).to_not have_content('Abs for days.')
  end
end
