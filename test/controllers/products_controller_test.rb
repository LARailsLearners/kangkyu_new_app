require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  class UserNotAuthenticated < ProductsControllerTest
    setup do
      @product = products(:one)
      # sign_out users(:one)
    end

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

    test "should not get new" do
      get :new
      assert_response :redirect
    end

    test "should create product" do
      assert_no_difference('Product.count') do
        post :create, product: { description: @product.description, name: @product.name, price: @product.price }
      end
    end

    test "should not get edit" do
      get :edit, id: @product
      assert_response :redirect
    end

    test "should not be able to update product" do
      patch :update, id: @product, product: { description: @product.description, name: @product.name, price: @product.price }
      assert_response :redirect
      assert_redirected_to new_user_session_path
    end

    test "should not be able to destroy product" do
      assert_no_difference 'Product.count' do
        delete :destroy, id: @product
      end
      assert_response :redirect
      assert_redirected_to new_user_session_path
    end
  end

  class UserAuthenticated < ProductsControllerTest
    setup do
      sign_in users(:one)
      @product = products(:one)
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

    class UserAuthorized < UserAuthenticated
      setup do
        @product = products(:one)
        sign_in @product.user
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

    class NotAuthorized < UserAuthenticated
      setup do
        @product = products(:one)
        assert_not_equal @product.user, products(:two).user
        sign_in products(:two).user
      end

      test "not authorized should get redirect" do
        get :edit, id: @product
        assert_response :redirect
      end

      test "should not be able to update product" do
        patch :update, id: @product, product: { description: @product.description, name: @product.name, price: @product.price }
        assert_response :redirect
        assert_redirected_to root_path
      end

      test "should not be able to destroy product" do
        assert_no_difference 'Product.count' do
          delete :destroy, id: @product
        end
        assert_response :redirect
        assert_redirected_to root_path
      end
    end
  end

end
