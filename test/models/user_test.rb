require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "usuário deve ter email" do
    user = User.new(email: nil)
    assert_not user.valid?
  end
end
