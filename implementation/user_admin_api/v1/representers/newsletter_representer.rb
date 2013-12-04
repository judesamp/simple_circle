module Implementation
  module UserAdminAPI
    require 'roar/representer/json'
    require 'roar/representer/feature/hypermedia'

    module NewsletterRepresenter
      include Roar::Representer::JSON
      include Roar::Representer::Feature::Hypermedia

      property :id
      property :title
      property :subtitle, :render_nil => true
      property :organization_id, :render_nil => true
      property :issues, :render_nil => true
     
      
      link :self do
        self.resource_uri
      end
    end
  end
end