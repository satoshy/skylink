class Film < ActiveRecord::Base
  mount_uploader :cover, CoverUploader

  validates :name, :description, :presence => true
  validates :name, length: { in: 1..250 }
  validates :description, length: { minimum: 1}
end
