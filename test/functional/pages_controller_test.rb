require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get visitor" do
    get :visitor
    assert_response :success
  end

  test "should get member" do
    get :member
    assert_response :success
  end

  test "should get merchant" do
    get :merchant
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

end
