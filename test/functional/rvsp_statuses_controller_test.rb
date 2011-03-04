require 'test_helper'

class RvspStatusesControllerTest < ActionController::TestCase
  setup do
    @rvsp_status = rvsp_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rvsp_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rvsp_status" do
    assert_difference('RvspStatus.count') do
      post :create, :rvsp_status => @rvsp_status.attributes
    end

    assert_redirected_to rvsp_status_path(assigns(:rvsp_status))
  end

  test "should show rvsp_status" do
    get :show, :id => @rvsp_status.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rvsp_status.to_param
    assert_response :success
  end

  test "should update rvsp_status" do
    put :update, :id => @rvsp_status.to_param, :rvsp_status => @rvsp_status.attributes
    assert_redirected_to rvsp_status_path(assigns(:rvsp_status))
  end

  test "should destroy rvsp_status" do
    assert_difference('RvspStatus.count', -1) do
      delete :destroy, :id => @rvsp_status.to_param
    end

    assert_redirected_to rvsp_statuses_path
  end
end
