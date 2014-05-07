require 'test_helper'

class SuperUsersControllerTest < ActionController::TestCase
  setup do
    @super_user = super_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:super_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create super_user" do
    assert_difference('SuperUser.count') do
      post :create, super_user: { email: @super_user.email, name: @super_user.name }
    end

    assert_redirected_to super_user_path(assigns(:super_user))
  end

  test "should show super_user" do
    get :show, id: @super_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @super_user
    assert_response :success
  end

  test "should update super_user" do
    patch :update, id: @super_user, super_user: { email: @super_user.email, name: @super_user.name }
    assert_redirected_to super_user_path(assigns(:super_user))
  end

  test "should destroy super_user" do
    assert_difference('SuperUser.count', -1) do
      delete :destroy, id: @super_user
    end

    assert_redirected_to super_users_path
  end
end
