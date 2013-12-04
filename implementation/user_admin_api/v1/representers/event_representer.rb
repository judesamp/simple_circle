module Implementation
  module UserAdminAPI
    require 'roar/representer/json'
    require 'roar/representer/feature/hypermedia'

    module EventRepresenter
      include Roar::Representer::JSON
      include Roar::Representer::Feature::Hypermedia

      property :id
      property :issue_id
      property :event_name,       :render_nil => true
      property :description,      :render_nil => true
      property :contact,          :render_nil => true
      property :contact_email,    :render_nil => true
      property :contact_phone,    :render_nil => true
      property :event_start_date, :render_nil => true
      property :event_end_date,   :render_nil => true
      property :expire_on,        :render_nil => true

      
      link :self do
        self.resource_uri
      end
    end
  end
end