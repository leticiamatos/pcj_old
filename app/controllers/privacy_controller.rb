# encoding: UTF-8
class PrivacyController < ApplicationController
  def index
    set_meta_tags :title       => 'Política de Privacidade',
                  :description => '',
                  :keywords    => ApplicationController.tag_lits
  end
end
