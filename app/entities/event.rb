require "dm_noisy_failures"

class Event
  include DataMapper::Resource
  	validates_presence_of :event_name

    property :id,                   Serial
    property :issue_id,				      Integer
    property :event_name,           String
    property :description,          Text
    property :contact,              String
    property :contact_email,        String
    property :contact_phone,        String
  	property :event_start_date,     Date
  	property :event_end_date,       Date
  	property :expire_on,            Date
  # 
    has n, :posts, :constraint => :destroy  
    has n, :issues, :model => 'Issue', :child_key => [:id], :parent_key => [:issue_id], :through => :posts

	def edit(attr)
    self.attributes = attr
    self.save
  end

  def resource_uri
    "/events/#{self.id}"
  end


end