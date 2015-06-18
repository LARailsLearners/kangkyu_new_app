require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @product = products(:one)
  end

  class WhenSignedOut < ProductsControllerTest
    # setup do
    #   sign_out users(:one)
    # end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:products)
    end

    test "should show product" do
      get :show, id: @product
      assert_response :success
    end

    test "not authenticated should get redirect" do
      get :edit, id: @product
      assert_response :redirect

      get :new
      assert_response :redirect
    end
  end

  class WhenUserSignedIn < ProductsControllerTest
    setup do
      sign_in users(:one)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create product" do
      assert_difference('Product.count') do
        post :create, product: { description: @product.description, name: @product.name, price: @product.price }
      end

      assert_redirected_to product_path(assigns(:product))
    end

    test "should get edit" do
      get :edit, id: @product
      assert_response :success
    end

    test "should update product" do
      patch :update, id: @product, product: { description: @product.description, name: @product.name, price: @product.price }
      assert_redirected_to product_path(assigns(:product))
    end

    test "should destroy product" do
      assert_difference('Product.count', -1) do
        delete :destroy, id: @product
      end

      assert_redirected_to products_path
    end
  end

end
