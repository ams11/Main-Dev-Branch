require 'test_helper'

class SproductsControllerTest < ActionController::TestCase
  setup do
    @sproduct = sproducts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sproducts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sproduct" do
    assert_difference('Sproduct.count') do
      post :create, :sproduct => @sproduct.attributes
    end

    assert_redirected_to sproduct_path(assigns(:sproduct))
  end

  test "should show sproduct" do
    get :show, :id => @sproduct.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sproduct.to_param
    assert_response :success
  end

  test "should update sproduct" do
    put :update, :id => @sproduct.to_param, :sproduct => @sproduct.attributes
    assert_redirected_to sproduct_path(assigns(:sproduct))
  end

  test "should destroy sproduct" do
    assert_difference('Sproduct.count', -1) do
      delete :destroy, :id => @sproduct.to_param
    end

    assert_redirected_to sproducts_path
  end
end
