class Spending < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :sum, :category
end
