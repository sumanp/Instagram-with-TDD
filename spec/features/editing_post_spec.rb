require 'rails_helper'

feature 'Editing posts' do
  background do
    post = create(:post)

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

  it "won't update a post without an image" do
    attach_file('Image', 'spec/files/cofee.zip')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form!")
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated hombre")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end
end
