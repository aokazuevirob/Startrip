require "test_helper"

class Admin::CountriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_countries_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_countries_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_countries_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_countries_edit_url
    assert_response :success
  end
end
