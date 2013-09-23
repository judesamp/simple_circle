require 'dm-timestamps'

class Newsletter
  include DataMapper::Resource
  property :id,						          Serial
  property :title,                  String
  property :organization_id,        Integer
  property :publish_date,           DateTime
  property :created_at,             DateTime
  property :created_on,             Date
  property :updated_at,             DateTime
  property :updated_on,             Date

  has n, :articles
  has n, :events
  # belongs_to :church

  def self.process
    newsletter = create
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