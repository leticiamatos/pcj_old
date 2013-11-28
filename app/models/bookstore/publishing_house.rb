class Bookstore::PublishingHouse < ActiveRecord::Base

    has_many :bookstore_books, :class_name => Bookstore::Book

    attr_accessible :name
end