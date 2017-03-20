# require 'rails_helper'
#
# background do
#   user = create(:user, id: 1)
#   post = create(:post, user_id: 1, id: 1, content: 'like me')
#   visit '/'
# end
#
# scenario 'can like a post' do
#   click_button 'like'
#   # Expect to see a "liked-post" class appear for the button (the button will turn solid red aka Instagram).
#   # Expect to see my name within the "liked by" area of the post.
#   expect(page).to have_content("")
# end
#
# scenario 'can unlike a post' do
#   # Repeat the above steps.
#   # Click the "like" button once more.
#   # Expect to see the "unlikes-post" class on the button.
#   # Expect to NOT see my name within the "liked by" area of the post
# end
