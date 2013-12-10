class Issue
  include DataMapper::Resource
  property :id,						           Serial
  property :newsletter_id,           Integer
  property :issue_number,            String
  property :publish_date,            DateTime
  property :published_on,            DateTime
  property :draft_name,              String
  # property :created_at,             DateTime
  # property :created_on,             Date
  # property :updated_at,             DateTime
  # property :updated_on,             Date

  has n, :posts
  has n, :articles, :through => :posts
  has n, :events, :through => :posts
  belongs_to :newsletter

  def resource_uri
    "/issues/#{self.id}"
  end

  
  def edit(new_values)
    self.attributes = new_values
    self.save
  end
  
  def add_article(article)
    self.articles << article
  end
  
  def add_event(event)
    self.events << event
  end
  
  # def add_announcements()
  # end

end