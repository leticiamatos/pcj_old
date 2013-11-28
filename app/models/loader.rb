class Loader < ActiveRecord::Base

  def self.load_content(model_name, category_name, options = {})

    section = Cms::Section.where(domain_id: ApplicationController::DOMAIN_ID, model_name: model_name).first
    category = section.categories.where(name: category_name).first

    page = nil unless options[:page]

    content = section.model_name.constantize.where(category_id: category.id).page(page)
    content = content.select(options[:select])  if options[:select]
    content = content.order(options[:order])    if options[:order]
    content = content.limit(options[:limit])    if options[:limit]

    content
  end

end
