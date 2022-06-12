require "test_helper"

class Public::CountriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_countries_index_url
    assert_response :success
  end

  test "should get show" do
    get public_countries_show_url
    assert_response :success
  end
end
