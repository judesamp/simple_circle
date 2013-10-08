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
    # property :img_url,              String
    # property :posted,               Date

    belongs_to :issue

    def self.process_and_create_draft(title)
        draft = create(title)
        if draft.valid?
            draft.save
        else
            begin
            rescue
            draft.errors.each do |error|
            puts error
            end
        end
      end
      draft
    end
    
    def edit_draft(attr)
        self.attributes = attr
    end




end