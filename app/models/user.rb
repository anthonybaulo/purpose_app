class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable, :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
         :validatable, :confirmable, :lockable, :timeoutable
  has_many :mission_statements, dependent: :destroy
end
