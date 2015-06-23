class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products

  # def is_super?
  #   false #TODO
  # end

  # # def can_change?(obj)
  # #   owns?(obj)
  # # end

  # # def owns?(obj)
  # #   obj.user == self
  # # end

  # auth - who are you?
  # authz - what can you do?
end
