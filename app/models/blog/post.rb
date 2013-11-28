class Blog::Post < ActiveRecord::Base
  belongs_to :blog, :class_name => Blog::Blog, :foreign_key => :blog_blog_id
  # belongs_to :user, :class_name => User
  attr_accessible :content, :title, :domain_id, :hits
end
