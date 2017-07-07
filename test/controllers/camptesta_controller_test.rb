require 'test_helper'

class CamptestaControllerTest < ActionController::TestCase
  setup do
    @camptestum = camptesta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:camptesta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camptestum" do
    assert_difference('Camptestum.count') do
      post :create, camptestum: { descrizione: @camptestum.descrizione, tipo: @camptestum.tipo, user_id: @camptestum.user_id }
    end

    assert_redirected_to camptestum_path(assigns(:camptestum))
  end

  test "should show camptestum" do
    get :show, id: @camptestum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @camptestum
    assert_response :success
  end

  test "should update camptestum" do
    patch :update, id: @camptestum, camptestum: { descrizione: @camptestum.descrizione, tipo: @camptestum.tipo, user_id: @camptestum.user_id }
    assert_redirected_to camptestum_path(assigns(:camptestum))
  end

  test "should destroy camptestum" do
    assert_difference('Camptestum.count', -1) do
      delete :destroy, id: @camptestum
    end

    assert_redirected_to camptesta_path
  end
end
