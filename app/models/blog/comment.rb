class Blog::Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, :class_name => Blog::Post
  attr_accessible :content, :enabled
end
