require "dm_noisy_failures"

require 'dm-timestamps'

class Issue
  include DataMapper::Resource
  property :id,						           Serial
  property :newsletter_id,           Integer
  property :issue_number,            String
  property :publish_on,              DateTime
  property :published_on,            DateTime
  # property :created_at,             DateTime
  # property :created_on,             Date
  # property :updated_at,             DateTime
  # property :updated_on,             Date

  has n, :articles
  has n, :events
  belongs_to :newsletter

  def self.process(attributes)
    begin
      issue = create(attributes)

    rescue DataMapper::SaveFailureError => e
      return e.message
    end
  end

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