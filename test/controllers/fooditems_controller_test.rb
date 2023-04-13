require "test_helper"

class FooditemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fooditems_index_url
    assert_response :success
  end

  test "should get new" do
    get fooditems_new_url
    assert_response :success
  end

  test "should get create" do
    get fooditems_create_url
    assert_response :success
  end

  test "should get update" do
    get fooditems_update_url
    assert_response :success
  end

  test "should get edit" do
    get fooditems_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get fooditems_destroy_url
    assert_response :success
  end
end
