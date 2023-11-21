require "test_helper"

class ShopCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shop_categories_new_url
    assert_response :success
  end

  test "should get edit" do
    get shop_categories_edit_url
    assert_response :success
  end

  test "should get show" do
    get shop_categories_show_url
    assert_response :success
  end

  test "should get index" do
    get shop_categories_index_url
    assert_response :success
  end
end
