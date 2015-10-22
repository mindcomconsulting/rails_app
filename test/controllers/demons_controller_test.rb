require 'test_helper'

class DemonsControllerTest < ActionController::TestCase
  setup do
    @demon = demons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:demons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create demon" do
    assert_difference('Demon.count') do
      post :create, demon: {  }
    end

    assert_redirected_to demon_path(assigns(:demon))
  end

  test "should show demon" do
    get :show, id: @demon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @demon
    assert_response :success
  end

  test "should update demon" do
    patch :update, id: @demon, demon: {  }
    assert_redirected_to demon_path(assigns(:demon))
  end

  test "should destroy demon" do
    assert_difference('Demon.count', -1) do
      delete :destroy, id: @demon
    end

    assert_redirected_to demons_path
  end
end
