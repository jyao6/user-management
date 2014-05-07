require 'test_helper'

class SelfiesControllerTest < ActionController::TestCase
  setup do
    @selfy = selfies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selfies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selfy" do
    assert_difference('Selfie.count') do
      post :create, selfy: { description: @selfy.description, source_url: @selfy.source_url }
    end

    assert_redirected_to selfy_path(assigns(:selfy))
  end

  test "should show selfy" do
    get :show, id: @selfy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selfy
    assert_response :success
  end

  test "should update selfy" do
    patch :update, id: @selfy, selfy: { description: @selfy.description, source_url: @selfy.source_url }
    assert_redirected_to selfy_path(assigns(:selfy))
  end

  test "should destroy selfy" do
    assert_difference('Selfie.count', -1) do
      delete :destroy, id: @selfy
    end

    assert_redirected_to selfies_path
  end
end
