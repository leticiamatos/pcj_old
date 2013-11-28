class HomeSweeper < ActionController::Caching::Sweeper
  observe Cers::Course, Cers::Group, Cers::Teacher
  
  def sweep(object)
    expire_page root_path
    expire_page "/"
    FileUtils.rm_rf "#{page_cache_directory}/home/page"
  end
  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
  alias_method :after_destroy, :sweep
end

