# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :sidebar

  DOMAIN_ID = 4 # set domain_id

  BANNER_CATEGORIES = {
    PRINCIPAL: "Principal",
    INTERNAL: "Interna",
    ADVERTISING: "Publicidade"
  }

  NEWS_CATEGORIES = {
    PRINCIPAL: "Principal"
  }

  DOWNLOAD_CATEGORIES = {
    INTERNAL: "Interna"
  }

  def self.load_banners(category_name, options = {})
    options.merge({ :order => 'cms_banners.order ASC, cms_banners.id DESC' }) if options[:order].blank?
    ApplicationController.load_content("Cms::Banner", category_name, options)
  end

  def self.load_news(category_name, options = {})
    options.merge({ :order => 'cms_news.order ASC, cms_news.id DESC' }) if options[:order].blank?
    ApplicationController.load_content("Cms::News", category_name, options)
  end

  def self.load_downloads(category_name, options = {})
    options.merge({ :order => 'cms_downloads.order ASC, cms_downloads.id DESC' }) if options[:order].blank?
    ApplicationController.load_content("Cms::Download", category_name, options)
  end

  def self.tag_list
    ApplicationController.domain.tag_list.to_s
  end

  def self.search(params = {})
    ApplicationController.load_news(nil).where("title ILIKE :q OR text ILIKE :q", :q => "%#{params[:q]}%").page(params[:page])
  end

  def news_box
    ApplicationController.load_news(ApplicationController::NEWS_CATEGORIES[:PRINCIPAL], :limit => 17, :order => 'cms_news.id DESC')
  end

  def increment_hits_banner
    banner = Cms::Banner.find(params[:id])
    banner.update_attributes(hits: banner.hits + 1)
    redirect_to banner.link
  end

  def increment_hits_download
    download = Cms::Download.select('cms_downloads.id, cms_downloads.hits, cms_downloads.file_file_name, cms_downloads.created_at, cms_downloads.file_updated_at').find(params[:id])
    download.update_attributes(hits: download.hits + 1)
    redirect_to download.file.url(:original)
  end

  private 
  def self.load_content(model_name, category_name, options = {})
    options.merge({ :order => :id }) unless options[:order]

    Loader.load_content(model_name, category_name, options)
  end
  
  def sidebar
  end

  Paperclip.interpolates :year do |attachment, style|
    attachment.instance.created_at.strftime('%Y')
  end

  Paperclip.interpolates :month do |attachment, style|
    attachment.instance.created_at.strftime('%m')
  end

  def add_metadata_to_mongolog
    if Rails.logger.respond_to?(:add_metadata)
      id = current_user ? current_user.id : nil
      Rails.logger.add_metadata(:additional_data => { :user_id => id })
    end
  end
  
  def self.domain
    Domain.find(DOMAIN_ID)
  end
end
