

class Organization
  include DataMapper::Resource

  property :id,                  Serial
  property :name,                String
  property :street_address,      String
  property :city,                String
  property :state,               String
  property :email,               String
  property :zip,                 String
  
  has n, :newsletters, :constraint => :destroy

  def self.process(attributes)
    begin
      organization = create(attributes)

    rescue DataMapper::SaveFailureError => e
      return e.message
    end
  end
 
  def resource_uri
    "/user_admin_api/organizations/#{self.id}"
  end
  
  def edit(attr)
  	self.attributes = attr
    self.save
  end

  def delete_org
    self.destroy
  end

  def add_newsletter(newsletter)
  	self.newsletters << newsletter
  end

end