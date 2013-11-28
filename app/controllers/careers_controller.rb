# encoding: UTF-8
class CareersController < ApplicationController
  caches_page :index 

  def index
  	@page = "careers-body"
    @cms_videos = Cms::Video.order(:title)
    set_meta_tags :title       => 'Carreiras',
                  :description => '',
                  :keywords    => ApplicationController.tag_list
  end

  def show
  	@page = "careers-show-body"
    @cms_video = Cms::Video.select('cms_videos.*').find(params[:id])
    @cms_videos = Cms::Video.select('cms_videos.description').order(:title)
    set_meta_tags :title       => 'Carreiras',
                  :description => '',
                  :keywords    => ApplicationController.tag_list
  end

  def self.recache
      expire_page "/carreiras"
      expire_page careers_path
  end
end
