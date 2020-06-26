class User < ApplicationRecord
  # Include default devise modules. Others available are... :omniauthable, :trackable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
         :validatable, :confirmable, :lockable, :timeoutable
  
  has_many :mission_statements, dependent: :destroy
  has_many :posts,              dependent: :destroy
end
