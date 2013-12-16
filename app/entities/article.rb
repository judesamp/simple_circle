require 'carrierwave/datamapper'
require_relative 'image_uploader'


class Article
    include DataMapper::Resource
    include DataMapper::Validate
    validates_presence_of :title

    property :id,                   Serial
    property :issue_id,             Integer
    property :title,                String
    property :summary,              Text
    property :tags,                 String
    property :article_text,         Text,          :lazy => false
    property :author,               String
    mount_uploader :top_image, ImageUploader
    mount_uploader :middle_image, ImageUploader
    mount_uploader :bottom_image, ImageUploader

    has n, :posts, :constraint => :destroy   
    has n, :issues, :model => 'Issue', :child_key => [:id], :parent_key => [:issue_id], :through => :posts

    def resource_uri
        "/articles/#{self.id}"
    end
end