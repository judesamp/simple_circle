require 'dm-timestamps'

class Newsletter
  include DataMapper::Resource
  validates_presence_of :title

  property :id,						          Serial
  property :title,                  String
  property :subtitle,               String
  property :organization_id,        Integer
  property :created_at,             DateTime
  property :created_on,             Date
  property :updated_at,             DateTime
  property :updated_on,             Date

  belongs_to :organization
  has n, :issues, :constraint => :destroy

  def self.process(newsletter_name)
    begin
      newsletter = create(newsletter_name)

    rescue DataMapper::SaveFailureError => e
      return e.message
    end
  end

  def resource_uri
    "/newsletters/#{self.id}"
  end
  
  def edit(new_values)
    self.attributes = new_values
    self.save
  end
  
  def add_issue(issue)
    self.issues << issue
    self.save
  end
end