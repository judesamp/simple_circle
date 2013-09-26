class Organization
  include DataMapper::Resource

  property :id,                    Serial
  property :name,                  String
  # property :street_address,      String
  # property :city,                String
  # property :state,               String
  # property :email,               String
  
  has n, :newsletters


  def self.process(attributes)
      organization = create(attributes)

      if organization.valid?
 
      else
         organization.errors.each {|error| puts error}
      end
    organization
  end


  def edit(attr)
  	self.attributes = attr
  end

  def add_newsletter(newsletter)
  	self.newsletters << newsletter
  end

end