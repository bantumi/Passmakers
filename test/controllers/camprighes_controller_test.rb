require 'test_helper'

class CamprighesControllerTest < ActionController::TestCase
  setup do
    @camprighe = camprighes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:camprighes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camprighe" do
    assert_difference('Camprighe.count') do
      post :create, camprighe: { camp_id: @camprighe.camp_id, contact_id: @camprighe.contact_id }
    end

    assert_redirected_to camprighe_path(assigns(:camprighe))
  end

  test "should show camprighe" do
    get :show, id: @camprighe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @camprighe
    assert_response :success
  end

  test "should update camprighe" do
    patch :update, id: @camprighe, camprighe: { camp_id: @camprighe.camp_id, contact_id: @camprighe.contact_id }
    assert_redirected_to camprighe_path(assigns(:camprighe))
  end

  test "should destroy camprighe" do
    assert_difference('Camprighe.count', -1) do
      delete :destroy, id: @camprighe
    end

    assert_redirected_to camprighes_path
  end
end
