# encoding: UTF-8
class Bookstore::BooksController < ApplicationController
  caches_page :index

  def index
    @page = "livros-body"

    @books = Bookstore::Book.salable.tagged_with("pcj").select('cers_products.slug AS slug, cers_products.title AS title').limit(8)
    @books = @books.where('cers_products.title ILIKE ?', "%#{params[:q]}%") unless params[:q].blank?

    @courses = Cers::Course.salable.tagged_with("pcj").limit(3).order(:title)
  end

  def self.recache
    expire_page "/livros"
    expire_page books_path
  end

end