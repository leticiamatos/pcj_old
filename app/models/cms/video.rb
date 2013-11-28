class Cms::Video < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => [:slugged, :history]
  has_paper_trail

  default_scope select('cms_videos.id, cms_videos.slug, cms_videos.thumb_file_name, cms_videos.thumb_updated_at, cms_videos.created_at, cms_videos.title')
  
  attr_accessible :description, :thumb, :title, :video

  has_attached_file :thumb,
                    :url    => ":attachment/:id-:style-:filename",
                    :path   => ":class/:year/:month/:id-:style-:filename"
end
