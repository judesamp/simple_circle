class Newsletter
  include DataMapper::Resource
  validates_presence_of :title

  property :id,						          Serial
  property :title,                  String
  property :subtitle,               String
  property :organization_id,        Integer
  property :created_at,             DateTime
  property :created_on,             Date
  property :updated_at,             DateTime
  property :updated_on,             Date

  belongs_to :organization
  has n, :issues, :constraint => :destroy

  def resource_uri
    "/newsletters/#{self.id}"
  end
end