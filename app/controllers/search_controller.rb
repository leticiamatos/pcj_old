# encoding: UTF-8
class SearchController < ApplicationController

  def index
    @results = ApplicationController.search(params)

    set_meta_tags :title       => 'Busca',
                  :description => 'Engine de Busca de Notícias',
                  :keywords    => ApplicationController.tag_list
  end
end