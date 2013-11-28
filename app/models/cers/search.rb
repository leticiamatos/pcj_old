class Cers::Search
  include MongoMapper::Document

  key :content, String
  key :times, Integer
end
