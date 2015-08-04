class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of   :email
  validates_presence_of   :password_digest

  has_many :spendings
  has_many :earnings

  def admin?
    self.role == 'admin'
  end

end
