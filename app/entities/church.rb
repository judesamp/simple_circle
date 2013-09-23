# class Church
#   include DataMapper::Resource
# 
#   property :id,                    Serial
#   property :name,                  String
#   property :street_address,        String
#   property :city,                  String
#   property :state,                String
#   property :email,                String
#   
#   has n, :newsletters
# end