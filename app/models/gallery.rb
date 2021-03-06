class Gallery < ApplicationRecord
  has_attached_file :asset, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_many :files, :foreign_key => :parent_id, :dependent => :destroy
  has_many :folders, :foreign_key => :parent_id, :dependent => :destroy
  scope :parent_folders, ->(user_id, type) { where(:user_id => id, :type => type) }
  belongs_to :user
  scope :all_folders, ->(user_id, type) { where(:user_id => user_id, :type => type) }

  validates_attachment :asset, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "application/zip", "application/msword", "application/vnd.ms-office application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"] }
  has_paper_trail
end
