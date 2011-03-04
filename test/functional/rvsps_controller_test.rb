require 'test_helper'

class RvspsControllerTest < ActionController::TestCase
  setup do
    @rvsp = rvsps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rvsps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rvsp" do
    assert_difference('Rvsp.count') do
      post :create, :rvsp => @rvsp.attributes
    end

    assert_redirected_to rvsp_path(assigns(:rvsp))
  end

  test "should show rvsp" do
    get :show, :id => @rvsp.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rvsp.to_param
    assert_response :success
  end

  test "should update rvsp" do
    put :update, :id => @rvsp.to_param, :rvsp => @rvsp.attributes
    assert_redirected_to rvsp_path(assigns(:rvsp))
  end

  test "should destroy rvsp" do
    assert_difference('Rvsp.count', -1) do
      delete :destroy, :id => @rvsp.to_param
    end

    assert_redirected_to rvsps_path
  end
end
