require "test_helper"

class DietasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dietas_index_url
    assert_response :success
  end

  test "should get show" do
    get dietas_show_url
    assert_response :success
  end

  test "should get new" do
    get dietas_new_url
    assert_response :success
  end

  test "should get create" do
    get dietas_create_url
    assert_response :success
  end

  test "should get edit" do
    get dietas_edit_url
    assert_response :success
  end

  test "should get update" do
    get dietas_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dietas_destroy_url
    assert_response :success
  end
end
