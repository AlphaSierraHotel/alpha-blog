require 'test_helper'

class CreateCategoriesTest <  ActionDispatch::IntegrationTest

  test "get new cateogry form and create category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "sports" } }
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match "sports", response.body
  end

  test "Invalid category submission results in failure" do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: " " } }
    end
    assert_template 'categories/new'
    assert_select 'h4.alert-heading'
    assert_select 'div#error-list'
  end
end
