class Gallery < ApplicationRecord
  has_attached_file :asset, default_url: "/images/:style/missing.png"

  has_many :files, :foreign_key => :parent_id, :dependent => :destroy
  has_many :folders, :foreign_key => :parent_id, :dependent => :destroy
  scope :all_folders, ->(user_id, type) { where(:user_id => user_id, :type => type) }

  validates_attachment :asset, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end