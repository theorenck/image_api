class Image < ActiveRecord::Base
  belongs_to :user

  scope :without_data, -> { select(:id, :user_id, :format, :size, :created_at, :updated_at) }
end
