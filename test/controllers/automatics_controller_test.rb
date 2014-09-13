require 'test_helper'

class AutomaticsControllerTest < ActionController::TestCase
  setup do
    @automatic = automatics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:automatics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create automatic" do
    assert_difference('Automatic.count') do
      post :create, automatic: { trip_map: @automatic.trip_map }
    end

    assert_redirected_to automatic_path(assigns(:automatic))
  end

  test "should show automatic" do
    get :show, id: @automatic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @automatic
    assert_response :success
  end

  test "should update automatic" do
    patch :update, id: @automatic, automatic: { trip_map: @automatic.trip_map }
    assert_redirected_to automatic_path(assigns(:automatic))
  end

  test "should destroy automatic" do
    assert_difference('Automatic.count', -1) do
      delete :destroy, id: @automatic
    end

    assert_redirected_to automatics_path
  end
end
