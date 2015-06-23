class ProductPolicy < ApplicationPolicy
  # attr_reader :user, :product

  # def initialize(user, product)
  #   super(user)
  #   @product = product
  # end

  def update?
    user == record.user
  end
end
