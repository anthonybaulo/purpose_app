class User < ApplicationRecord
  # Include default devise modules. Others available are... :omniauthable, :trackable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
         :validatable, :confirmable, :lockable, :timeoutable
  
  has_many :mission_statements,   dependent: :destroy
  has_many :posts,                dependent: :destroy
  
  # Set up active relationship to follow other users
  has_many :active_relationships, class_name:  "Relationship", # Model name
                                  foreign_key: "follower_id",  # Column name
                                  dependent:   :destroy

  # Create association with following (read "is following")
  has_many :following, through: :active_relationships, 
                       source:  :followed                # followed_id column

  # Set up passive relationships for being followed by other users
  has_many :passive_relationships, class_name:  "Relationship", # Model
                                   foreign_key: "followed_id",  # Column
                                   dependent:   :destroy

  # Create association with followers
  has_many :followers, through: :passive_relationships,
                       source:  :follower

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    Post.where("user_id IN (SELECT followed_id FROM relationships
                            WHERE follower_id = ?) 
                AND public = true", id) 
  end
end
