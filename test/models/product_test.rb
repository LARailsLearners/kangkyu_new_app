require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  setup do
    @product = products(:one)
  end

  test "belongs to a user" do
    @product.user = nil
    assert_not @product.valid?
  end

  def test_has_a_name
    @product.name = ""
    assert_not @product.valid?
  end
end
