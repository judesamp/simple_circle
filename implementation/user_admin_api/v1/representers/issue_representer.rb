module Implementation
  module UserAdminAPI
    require 'roar/representer/json'
    require 'roar/representer/feature/hypermedia'

    module IssueRepresenter
      include Roar::Representer::JSON
      include Roar::Representer::Feature::Hypermedia

      property :newsletter_id
      property :issue_number, :render_nil => true
      # property :name
      # property :email, :render_nil => true
      # property :street_address, :render_nil => true
      # property :city, :render_nil => true
      # property :state, :render_nil => true
      # property :zip, :render_nil => true
      
      link :self do
        self.resource_uri
      end
    end
  end
end