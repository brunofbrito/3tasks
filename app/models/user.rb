class User < ActiveRecord::Base
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
  has_many :tasks
end
