class Cms::Download < ActiveRecord::Base
  acts_as_taggable

  default_scope lambda { where('(cms_downloads.published_at <= ? AND (cms_downloads.unpublished_at > ? OR cms_downloads.unpublished_at IS NULL)) AND cms_downloads.enabled = true', Time.now.in_time_zone, Time.now.in_time_zone) }

  belongs_to :category

  attr_accessible :hits

  has_attached_file :file,
                    :url  => ":attachment/:id-:filename",
                    :path => ":class/:year/:month/:id-:filename"

end
