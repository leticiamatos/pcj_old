class Cms::Banner < ActiveRecord::Base

  default_scope lambda { select('cms_banners.id, cms_banners.title, cms_banners.description, cms_banners.image_file_name, cms_banners.image_updated_at, cms_banners.link, cms_banners.created_at, cms_banners.hits').where('(cms_banners.published_at <= ? AND (cms_banners.unpublished_at > ? OR cms_banners.unpublished_at IS NULL)) AND cms_banners.enabled = true', Time.now.in_time_zone, Time.now.in_time_zone) }

  belongs_to :category

  attr_accessible :hits

  has_attached_file :image,
                    :url  => ":attachment/:id-:filename",
                    :path => ":class/:year/:month/:id-:filename"

end
