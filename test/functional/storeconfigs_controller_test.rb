require 'test_helper'

class StoreconfigsControllerTest < ActionController::TestCase
  setup do
    @storeconfig = storeconfigs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storeconfigs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storeconfig" do
    assert_difference('Storeconfig.count') do
      post :create, :storeconfig => @storeconfig.attributes
    end

    assert_redirected_to storeconfig_path(assigns(:storeconfig))
  end

  test "should show storeconfig" do
    get :show, :id => @storeconfig.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @storeconfig.to_param
    assert_response :success
  end

  test "should update storeconfig" do
    put :update, :id => @storeconfig.to_param, :storeconfig => @storeconfig.attributes
    assert_redirected_to storeconfig_path(assigns(:storeconfig))
  end

  test "should destroy storeconfig" do
    assert_difference('Storeconfig.count', -1) do
      delete :destroy, :id => @storeconfig.to_param
    end

    assert_redirected_to storeconfigs_path
  end
end
