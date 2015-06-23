class Product < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :name, presence: true

  # def user_owns?(u)
  #   self.user == u
  # end

  # # biz logic
  # def user_can_view?(u)
  #   user_owns?(u) #true
  # end

  # def user_can_change?(u)
  #   return false unless user
  #   self.user_owns?(u) || u.is_super?
  # end
end
