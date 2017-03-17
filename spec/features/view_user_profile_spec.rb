feature 'viewing user profiles' do
  background do
    user = create(:user, user_name: 'user_one')
    user_two = create(:user, user_name: 'user_two', email: 'wat@wat.in', id: user.id + 1)
    post = create(:post, user_id: user.id)
    post = create(:post, user_id: user_two.id, caption: "not mine")
    sign_in_with user
    visit '/'
    click_link user.user_name
  end

  scenario 'visiting a profile page shows the user name in the url' do
    expect(page.current_path).to eq(profile_path('user_one'))
  end

  scenario "a profile page only shows the specified user's posts" do
    expect(page).to have_content 'nofilter'
    expect(page).to_not have_content 'not mine'
  end
end
