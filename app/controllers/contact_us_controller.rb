# encoding: UTF-8
class ContactUsController < ApplicationController
  def index
    set_meta_tags :title       => 'Contato',
                  :description => '',
                  :keywords    => ApplicationController.tag_list
  end
end
