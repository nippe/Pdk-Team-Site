require 'test_helper'

class RvspsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get attend" do
    get :attend
    assert_response :success
  end

  test "should get maybe" do
    get :maybe
    assert_response :success
  end

  test "should get not" do
    get :not
    assert_response :success
  end

end
