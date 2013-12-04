class Post
  include DataMapper::Resource

    property :id,                   Serial
    property :position,             Integer
  

    belongs_to :issue  	
  	belongs_to :article, :required => false
    belongs_to :event, :required => false

end