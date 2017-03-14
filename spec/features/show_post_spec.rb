require 'spec_helper'

feature 'Can view individual posts' do
  before do
    user = create(:user)
    post = create(:post)

    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'
  end

  scenario 'Can click and view a single post' do
    post = create(:post)
    visit '/'
    click_link(href: post_path(post))
    expect(page.current_path).to eq(post_path(post))
  end

  #todo refactor
end
