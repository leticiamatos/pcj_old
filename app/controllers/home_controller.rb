# encoding: UTF-8
class HomeController < ApplicationController

  caches_page :index
  cache_sweeper :home_sweeper

  def index
    set_meta_tags :title       => ApplicationController.domain.name,
                  :description => ApplicationController.domain.description,
                  :keywords    => ApplicationController.tag_list

    @teachers = load_main_teachers

    @banners  = ApplicationController.load_banners(ApplicationController::BANNER_CATEGORIES[:PRINCIPAL], :select => 'cms_banners.title, cms_banners.description, cms_banners.image_file_name, cms_banners.image_updated_at')
    @news_box = news_box

    @books    = Bookstore::Book.salable.tagged_with("pcj").limit(4)
    @featured_courses  = Cers::Course.salable.tagged_with("pcj").order('cers_products.featured DESC, cers_courses.id DESC').limit(7)
    @featured_books = @books.where('cers_products.featured IS TRUE')
    
    @page = "main-body"
    @rotative = true
    
    @category_groups    = Cers::Group.includes(:cers_categories)
  end

  def lancamento
    redirect_to "/lancamento"
  end

  def load_main_teachers
    ids = [260, 261, 258, 265, 107, 257, 217, 173]
    teachers = []
    for i in 0...ids.length
      teachers << Cers::Teacher.select('cers_teachers.id, cers_teachers.slug, cers_teachers.name, cers_teachers.avatar_file_name, cers_teachers.avatar_updated_at, cers_teachers.created_at').find(ids[i])
    end
    teachers
  end

  def self.recache
    expire_page "/"
    expire_page root_path
  end

  def infografico
    redirect_to dicas_de_estudo_path
  end

  def dicas_de_estudo
  end

end