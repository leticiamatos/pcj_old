# encoding: UTF-8
class Cers::TeachersController < ApplicationController
    caches_page :index

    def index
      @page = "teachers-body"

      @teachers = Cers::Teacher.tagged_with("pcj").order(:name)
      @news_box = news_box
    end

    def show
      @page = "teachers-body teachers-profile-body"
      @teacher = Cers::Teacher.select('cers_teachers.about, cers_teachers.cover_file_name, cers_teachers.cover_updated_at').find(params[:id])
      @cers_courses_teacher = @teacher.cers_courses.salable.order('cers_products.title').limit(4)
    end

    def self.recache
      expire_page "/professores"
      expire_page teachers_path
    end

end