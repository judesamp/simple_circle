class Event
  include DataMapper::Resource
  	validates_presence_of :event_name
  
	  property :id,                   Serial
	  property :issue_id,				      Integer
	  property :event_name,           String
	  property :description,          Text
	  property :author,               String
		property :event_start_date,     Date
		property :event_end_date,       Date
#   property :posted,               Date
		property :expire_on,            Date
#  
    belongs_to :issue


  def self.process_and_create_event_draft(event_name)
      event_draft = create(event_name)
      if event_draft.valid?
        event_draft.save
      else
        event_draft.errors.each do |error|
        puts error
      end
    end
    event_draft
   end

	def edit_draft(attr)
    self.attributes = attr
  end


end