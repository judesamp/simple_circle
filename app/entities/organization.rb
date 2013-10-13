require "dm_noisy_failures"

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
    begin
      organization = create(attributes)

    rescue DataMapper::SaveFailureError => e
      return e.message
    end
  end

  def edit(attr)
  	self.attributes = attr
  end

  def delete_org
    self.destroy
  end

  def add_newsletter(newsletter)
  	self.newsletters << newsletter
  end

end