class UserSerializer < ActiveModel::Serializer
  
  attributes :id, :username, :email, :token, :url, :created_at

  def url
  	url_for [:api,:v1,object]
  end
end
