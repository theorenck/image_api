class Image < ActiveRecord::Base
  belongs_to :user

	validates :data, presence: true, length: { 
  	within: 1..3.megabyte, 
  	too_long: "The size of the image you send exceeds the limit of 3MB.",
  	too_short: "The image you send is empty."
	}

  scope :without_data, -> { select(:id, :user_id, :format, :size, :created_at, :updated_at) }

end
