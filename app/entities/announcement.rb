# class Announcement
#   include DataMapper::Resource
# 
#   property :id,                      Serial
#   property :header,                  String
#   property :accouncement_text,      Text
#   property :author,                  String
#   property :posted,                  Date
#   property :expire_on,              Date
# 
# 
#   belongs_to :newsletter
# end