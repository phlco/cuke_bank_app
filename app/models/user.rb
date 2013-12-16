class User < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: { message: "Please enter a name" }
end
