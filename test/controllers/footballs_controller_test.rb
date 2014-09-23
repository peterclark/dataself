require 'test_helper'

class FootballsControllerTest < ActionController::TestCase
  setup do
    @football = footballs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:footballs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create football" do
    assert_difference('Football.count') do
      post :create, football: { player: @football.player, player_url: @football.player_url, status: @football.status, team: @football.team }
    end

    assert_redirected_to football_path(assigns(:football))
  end

  test "should show football" do
    get :show, id: @football
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @football
    assert_response :success
  end

  test "should update football" do
    patch :update, id: @football, football: { player: @football.player, player_url: @football.player_url, status: @football.status, team: @football.team }
    assert_redirected_to football_path(assigns(:football))
  end

  test "should destroy football" do
    assert_difference('Football.count', -1) do
      delete :destroy, id: @football
    end

    assert_redirected_to footballs_path
  end
end
