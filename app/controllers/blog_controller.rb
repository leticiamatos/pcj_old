# encoding: UTF-8
class BlogController < ApplicationController

  def index
  	@page = "blog-body"
    set_meta_tags :title       => 'Blog',
                  :description => '',
                  :keywords    => ApplicationController.tag_list
  end

   def show
  	@page = "blog-body blog-show-body"
    set_meta_tags :title       => 'Blog',
                  :description => '',
                  :keywords    => ApplicationController.tag_list
  end

end
