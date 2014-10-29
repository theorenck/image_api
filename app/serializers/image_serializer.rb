class ImageSerializer < ActiveModel::Serializer
  
  attributes :id, :format, :size, :url, :created_at
  
  def url
  	url_for [:api,:v1,object.user,object]
  end
end