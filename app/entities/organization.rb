

class Organization
  include DataMapper::Resource
  validates_presence_of :name

  property :id,                   Serial
  property :name,                 String
  property :street_address,       String
  property :city,                 String
  property :state,                String
  property :email,                String
  property :zip,                  String
  property :status,               String, :default  => "active"
  
  has 1, :newsletter, :constraint => :destroy

  def resource_uri
    "/organizations/#{self.id}"
  end
  
  def edit(attr)
  	self.attributes = attr
    self.save
  end

  def delete_org
    self.destroy
  end
end