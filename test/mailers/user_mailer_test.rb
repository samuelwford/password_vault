require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:one)
  end
  
  test "password_reset" do
    token = User.new_token
    mail = UserMailer.password_reset(@user, token)
    assert_equal "Password Reset", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match token, mail.body.encoded
  end

end
