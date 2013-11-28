# encoding: UTF-8
class Cers::CoursesController < ApplicationController

  def index
    @page = "online-courses-body"
    @courses = Cers::Course.salable.limit(4)
    @featured_books = Bookstore::Book.salable.limit(3)
    @featured_courses  = Cers::Course.salable.order('cers_products.featured DESC, cers_courses.id DESC').limit(4)
    @category_groups    = Cers::Group.where(:enabled => true, :domain_id => ApplicationController::DOMAIN_ID).order(:title).limit(7)
  end

  def search
    @page      = 'cursos cursos-online no-bg'
    filter_courses_title  = Cers::Course.salable.where("cers_products.title ILIKE ?", "%#{params[:search]}%")
    filter_courses_teacher  = Cers::Course.salable.joins(:cers_teachers).where("cers_teachers.name ILIKE ?", "%#{params[:search]}%")
    filter_courses_tags = Cers::Course.salable.tagged_with(params[:search])
    @courses = filter_courses_teacher | filter_courses_title | filter_courses_tags
    filter_books_title  = Bookstore::Book.salable.where("cers_products.title ILIKE ?", "%#{params[:search]}%")
    filter_books_tags = Bookstore::Book.salable.tagged_with(params[:search])
    @books = filter_books_title | filter_books_tags
    store_search(params[:search])
    @search  = params[:search]
    render :partial => "search"
  end

  private
  def store_search(search)
    search_query = Cers::Search.first(:content => search)
    (search_query.blank?) ? Cers::Search.create(:content => search, :times => 1) : search_query.update_attributes(:times => search_query.times + 1)
  end

  def self.recache
    expire_page "/cursos"
    expire_page courses_path
  end

end