require 'spec_helper'

feature 'Can view individual posts' do
  before do
    user = create(:user)
    sign_in_with user

    @post = create(:post, user_id: user.id)

  end

  scenario 'Can click and view a single post' do
    visit '/'
    click_link(href: post_path(@post))
    expect(page.current_path).to eq(post_path(@post))
  end

  #todo refactor
end
