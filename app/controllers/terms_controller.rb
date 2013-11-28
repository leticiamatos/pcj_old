# encoding: UTF-8
class TermsController < ApplicationController
  def index
    set_meta_tags :title       => 'Termos de Uso',
                  :description => '',
                  :keywords    => ApplicationController.tag_list
  end
end
