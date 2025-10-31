require "test_helper"

class TreinosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get treinos_index_url
    assert_response :success
  end

  test "should get show" do
    get treinos_show_url
    assert_response :success
  end

  test "should get new" do
    get treinos_new_url
    assert_response :success
  end

  test "should get create" do
    get treinos_create_url
    assert_response :success
  end

  test "should get edit" do
    get treinos_edit_url
    assert_response :success
  end

  test "should get update" do
    get treinos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get treinos_destroy_url
    assert_response :success
  end
end
