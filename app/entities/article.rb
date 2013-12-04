class Article
  include DataMapper::Resource
   validates_presence_of :title

    property :id,                   Serial
    property :issue_id,             Integer
    property :title,                String
    property :summary,              Text
    property :tags,                 String
    property :article_text,         Text,           :lazy => false
    property :author,               String
    property :img_url,              String

    has n, :posts, :constraint => :destroy   
    has n, :issues, :model => 'Issue', :child_key => [:id], :parent_key => [:issue_id], :through => :posts

    def resource_uri
        "/articles/#{self.id}"
    end
    
    def edit(attr)
        self.attributes = attr
        self.save
    end
end