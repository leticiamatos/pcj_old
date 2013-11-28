# encoding: UTF-8
class Cms::NewsController < ApplicationController
  caches_page :index

  def index
    set_meta_tags :title       => 'Notícias',
                  :description => '',
                  :keywords    => ApplicationController.tag_list
    @page = "news-body"

    @banners   = ApplicationController.load_banners(ApplicationController::BANNER_CATEGORIES[:INTERNAL])
    @news      = ApplicationController.load_news(ApplicationController::NEWS_CATEGORIES[:PRINCIPAL], :limit => 9, :order => "cms_news.id DESC")
    @news_hits = ApplicationController.load_news(ApplicationController::NEWS_CATEGORIES[:PRINCIPAL], :limit => 17, :order => "cms_news.hits DESC")
  end

  def show
   @news = Cms::News.select('cms_news.hits, cms_news.text, cms_news.published_at').find(params[:id])
   @news_box = news_box
   @news_related = Cms::News.limit(4)
   @news.hits += 1
   @news.save

   @page = "news-body news-detail-body"
   @content_outer = true

   set_meta_tags :title       => @news.title,
                  :description => '',
                  :keywords    => ApplicationController.tag_list + @news.tag_list.to_s
  end

  def self.recache
    expire_page "/noticias"
    expire_page news_path
  end

end
