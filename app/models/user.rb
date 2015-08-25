class User < ActiveRecord::Base
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
end
