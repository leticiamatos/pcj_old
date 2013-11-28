# encoding: UTF-8
class Cms::DownloadController < ApplicationController
  # caches_page :index

  def index
    @page = "downloads-body"
    @downloads = Cms::Download.select("t.name as tag,  cms_downloads.id, cms_downloads.title, cms_downloads.created_at").joins("INNER JOIN taggings tg ON tg.taggable_id = cms_downloads.id").joins("INNER JOIN tags t ON t.id = tg.tag_id").where("tg.taggable_type = 'Cms::Download' AND tg.context = 'tags' AND tg.tagger_id IS NULL AND cms_downloads.category_id = 14").order("t.name, cms_downloads.title")

    # @downloads = ApplicationController.load_downloads(ApplicationController::DOWNLOAD_CATEGORIES[:INTERNAL], :order => 'cms_downloads.title')
    @courses = Cers::Course.limit(3).order('RANDOM()')

    @taggs = []
   	@downloads.each do |download|
   		@taggs << download.tag_list
   	end
   	#remove repetições no array de taggs
    @taggs.uniq!
    @taggs.sort!

    set_meta_tags :title       => 'Downloads',
                  :description => '',
                  :keywords    => ApplicationController.tag_list
  end

  def download
    download = Cms::Download.find(params[:id])
    send_data(open(download.file.url).read,
              :filename => download.file_file_name ,
              :type => 'application/force-download',
              :disposition => 'attachment')
  end

  def self.recache
    expire_page "/downloads"
    expire_page downloads_path
  end
end
