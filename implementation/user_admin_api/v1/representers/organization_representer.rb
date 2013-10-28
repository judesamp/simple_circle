module Implementation
  module UserAdminAPI
    require 'roar/representer/json'
    require 'roar/representer/feature/hypermedia'

    module OrganizationRepresenter
      include Roar::Representer::JSON
      include Roar::Representer::Feature::Hypermedia

      property :name
      property :email, :render_nil => true
      property :street_address, :render_nil => true
      property :city, :render_nil => true
      property :state, :render_nil => true
      property :zip, :render_nil => true
      
      link :self do
        self.resource_uri
      end
    end
  end
end