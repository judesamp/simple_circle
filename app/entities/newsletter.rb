require "dm_noisy_failures"
require 'dm-timestamps'

class Newsletter
  include DataMapper::Resource
  property :id,						          Serial
  property :name,                  String
  property :organization_id,        Integer
  property :created_at,             DateTime
  property :created_on,             Date
  property :updated_at,             DateTime
  property :updated_on,             Date

  belongs_to :organization
  has n, :issues

  def self.process
    newsletter = create
    if newsletter.valid?
      newsletter.save
      newsletter
    else
      errors = [false]
      newsletter.errors.each {|error| errors.push(error)}
      errors
    end
  end
  
  def edit(new_values)
    self.attributes = new_values
    self.save
  end
  
  def add_issue(issue)
    self.issues << issue
    self.save
  end
end