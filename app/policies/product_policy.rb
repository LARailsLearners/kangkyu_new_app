class ProductPolicy < ApplicationPolicy
  # attr_reader :user, :product

  # def initialize(user, product)
  #   super(user)
  #   @product = product
  # end

  def update?
    user.try(:admin?) or user == record.user
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
