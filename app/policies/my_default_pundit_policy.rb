class MyDefaultPunditPolicy < ApplicationPolicy

  def index?
    user.admin?
  end
end
