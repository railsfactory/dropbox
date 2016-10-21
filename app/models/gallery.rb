class Gallery < ApplicationRecord
  has_many :files, :foreign_key => :parent_id, :dependent => :destroy
  has_many :folders, :foreign_key => :parent_id, :dependent => :destroy
  scope :parent_folders, ->(user_id, type) { where(:user_id => id, :type => type) }
  belongs_to :user
end
