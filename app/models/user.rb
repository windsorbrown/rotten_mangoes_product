class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password
  validates :email, presence: true
  validates :firstname, presence:true
  validates :lastname, presence: true
  paginates_per 10
  
  def full_name
    "#{firstname} #{lastname}"
  end

end
