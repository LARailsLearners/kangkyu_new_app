class User < ActiveRecord::Base
  enum role: { member: 0, admin: 1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
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
