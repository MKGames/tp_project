require 'test_helper'

class AnswerControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get answer" do
    get answer_controller_answer_url
    assert_response :success
  end

end
