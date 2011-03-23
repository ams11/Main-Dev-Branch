require 'test_helper'

class MproductsControllerTest < ActionController::TestCase
  setup do
    @mproduct = mproducts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mproducts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mproduct" do
    assert_difference('Mproduct.count') do
      post :create, :mproduct => @mproduct.attributes
    end

    assert_redirected_to mproduct_path(assigns(:mproduct))
  end

  test "should show mproduct" do
    get :show, :id => @mproduct.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mproduct.to_param
    assert_response :success
  end

  test "should update mproduct" do
    put :update, :id => @mproduct.to_param, :mproduct => @mproduct.attributes
    assert_redirected_to mproduct_path(assigns(:mproduct))
  end

  test "should destroy mproduct" do
    assert_difference('Mproduct.count', -1) do
      delete :destroy, :id => @mproduct.to_param
    end

    assert_redirected_to mproducts_path
  end
end
