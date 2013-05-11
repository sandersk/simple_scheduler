class User < ActiveRecord::Base
  attr_accessible :email, :person

  has_many :appointments, :dependent => :destroy
end
