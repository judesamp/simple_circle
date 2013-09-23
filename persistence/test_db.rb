require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(:default, 'postgres://user:password@hostname/database')


module Persistence
  class TestData #this becomes a module which is included in Domain::Game
    include DataMapper::Resource
  

   
   
    #actual fields on the table
    property :id,                             Serial
    property :name,                           String
    property :age,                            Integer
    property :email,                          String
    property :date,                           DateTime
  
  
  end
end                   
