class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :vending_machines
  has_many :bookings

  def is_vendor?
    user_type == 3
  end

  def is_refiller?
    user_type == 2
  end
end
