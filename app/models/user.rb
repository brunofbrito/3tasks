class User < ActiveRecord::Base
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
  mount_uploader :background, BackgroundUploader
  has_many :tasks

  def after_initialize
  end
end
