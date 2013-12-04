module Implementation
  module UserAdminAPI
    require 'roar/representer/json'
    require 'roar/representer/feature/hypermedia'

    module ArticleRepresenter
      include Roar::Representer::JSON
      include Roar::Representer::Feature::Hypermedia

      property :id
      property :issue_id
      property :title, :render_nil => true
      property :summary, :render_nil => true
      property :tags, :render_nil => true
      property :article_text, :render_nil => true
      property :author, :render_nil => true
      property :img_url, :render_nil => true
      
      link :self do
        self.resource_uri
      end
    end
  end
end