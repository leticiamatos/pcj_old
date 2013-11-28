# encoding: UTF-8
class AboutUsController < ApplicationController

  def index
    set_meta_tags :title       => 'Quem Somos',
                  :description => '',
                  :keywords    => ApplicationController.tag_list
  end
end
