require 'test_helper'

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get subscriptions_signup_url
    assert_response :success
  end

  test "should get expire" do
    get subscriptions_expire_url
    assert_response :success
  end

  test "should get remove" do
    get subscriptions_remove_url
    assert_response :success
  end

end
