class Article
  include DataMapper::Resource
   validates_presence_of :title

    property :id,                   Serial
    property :issue_id,             Integer
    property :title,                String
    property :summary,              Text
    property :tags,                 String
    property :article_text,         Text
    property :author,               String
    property :img_url,              String

    belongs_to :issue



    def self.process(attributes)
        begin
          article = create(attributes)

        rescue DataMapper::SaveFailureError => e
          return e.message
        end
    end

    def resource_uri
        "/articles/#{self.id}"
    end
    
    def edit_draft(attr)
        self.attributes = attr
        self.save
    end




end