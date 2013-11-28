class Cms::News < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  acts_as_taggable

  default_scope lambda { select('cms_news.id, cms_news.slug, cms_news.title, cms_news.text, cms_news.thumb_file_name, cms_news.thumb_updated_at, cms_news.created_at').where('(cms_news.published_at <= ? AND (cms_news.unpublished_at > ? OR cms_news.unpublished_at IS NULL)) AND cms_news.enabled = true', Time.now.in_time_zone, Time.now.in_time_zone) }

  belongs_to :category

  has_attached_file :thumb,
                    :url    => ":attachment/:id-:style-:filename",
                    :path   => ":class/:year/:month/:id-:style-:filename",
                    :styles => { default: "235x110>" }

  attr_accessible :text,  :enabled, :title, :order, :publish_at, :unpublish_at,
                  :category_id, :thumb, :id, :thumb_file_name, :thumb_content_type,
                  :thumb_file_size, :thumb_updated_at, :slug, :hits, :created_at,
                  :updated_at, :tag_list
end
