# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130604172305) do

  create_table "bookstore_books", :force => true do |t|
    t.string   "author"
    t.integer  "bookstore_publishing_house_id"
    t.string   "isbn"
    t.string   "edition"
    t.integer  "size"
    t.string   "path_id"
    t.text     "synopsis"
    t.integer  "pages"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.datetime "expire_at"
    t.integer  "available_time"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "bookstore_books", ["bookstore_publishing_house_id"], :name => "index_bookstore_books_on_bookstore_publishing_house_id"

  create_table "bookstore_publishing_houses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cers_attachments", :force => true do |t|
    t.integer  "cers_server_id"
    t.string   "title"
    t.string   "media_file_name"
    t.string   "media_content_type"
    t.integer  "media_file_size"
    t.datetime "media_updated_at"
    t.boolean  "enabled",            :default => true
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "cers_attachments", ["cers_server_id"], :name => "index_cers_attachments_on_cers_server_id"

  create_table "cers_categories", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.boolean  "enabled"
    t.integer  "cers_category_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "cers_categories", ["cers_category_id"], :name => "index_cers_categories_on_cers_category_id"

  create_table "cers_category_courses", :force => true do |t|
    t.integer  "cers_category_id"
    t.integer  "cers_course_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "cers_category_courses", ["cers_category_id"], :name => "index_cers_category_courses_on_cers_category_id"
  add_index "cers_category_courses", ["cers_course_id"], :name => "index_cers_category_courses_on_cers_course_id"

  create_table "cers_certificate_templates", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "bg_image_file_name"
    t.string   "bg_image_content_type"
    t.integer  "bg_image_file_size"
    t.datetime "bg_image_updated_at"
    t.boolean  "enabled"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "cers_certificates", :force => true do |t|
    t.integer  "cers_subscription_id"
    t.integer  "cers_certificate_template_id"
    t.text     "content"
    t.integer  "sequence"
    t.string   "authenticity_code"
    t.boolean  "blocked",                      :default => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "cers_certificates", ["cers_certificate_template_id"], :name => "index_cers_certificates_on_cers_certificate_template_id"
  add_index "cers_certificates", ["cers_subscription_id"], :name => "index_cers_certificates_on_cers_subscription_id"

  create_table "cers_course_subject_teachers", :force => true do |t|
    t.integer  "cers_course_id"
    t.integer  "cers_subject_id"
    t.integer  "cers_teacher_id"
    t.integer  "mirrored_from_id"
    t.integer  "quantity_of_lessons"
    t.boolean  "receive_message",     :default => true
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "cers_course_subject_teachers", ["cers_course_id"], :name => "index_cers_course_subject_teachers_on_cers_course_id"
  add_index "cers_course_subject_teachers", ["cers_subject_id"], :name => "index_cers_course_subject_teachers_on_cers_subject_id"
  add_index "cers_course_subject_teachers", ["cers_teacher_id"], :name => "index_cers_course_subject_teachers_on_cers_teacher_id"
  add_index "cers_course_subject_teachers", ["mirrored_from_id"], :name => "index_cers_course_subject_teachers_on_mirrored_from_id"

  create_table "cers_course_transmissions", :force => true do |t|
    t.string   "title"
    t.integer  "cers_course_id"
    t.integer  "cers_transmission_setting_id"
    t.string   "channel"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "button_image_file_name"
    t.string   "button_image_content_type"
    t.integer  "button_image_file_size"
    t.datetime "button_image_updated_at"
    t.integer  "hits"
    t.boolean  "status"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "cers_course_transmissions", ["cers_course_id"], :name => "index_cers_course_transmissions_on_cers_course_id"
  add_index "cers_course_transmissions", ["cers_transmission_setting_id"], :name => "index_cers_course_transmissions_on_cers_transmission_setting_id"

  create_table "cers_courses", :force => true do |t|
    t.integer  "course_type"
    t.string   "public_notice_link"
    t.datetime "expire_at"
    t.datetime "release_ended_at"
    t.integer  "available_time"
    t.integer  "access_time"
    t.float    "workload"
    t.text     "goal_description"
    t.text     "workload_description"
    t.text     "programmatic_content"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "cers_certificate_template_id"
    t.integer  "cers_video_id"
    t.integer  "coordinator_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "cers_courses", ["cers_certificate_template_id"], :name => "index_cers_courses_on_cers_certificate_template_id"
  add_index "cers_courses", ["cers_video_id"], :name => "index_cers_courses_on_cers_video_id"
  add_index "cers_courses", ["coordinator_id"], :name => "index_cers_courses_on_coordinator_id"

  create_table "cers_group_categories", :force => true do |t|
    t.integer  "cers_category_id"
    t.integer  "cers_group_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "cers_group_categories", ["cers_category_id"], :name => "index_cers_group_categories_on_cers_category_id"
  add_index "cers_group_categories", ["cers_group_id"], :name => "index_cers_group_categories_on_cers_group_id"

  create_table "cers_groups", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "description"
    t.boolean  "enabled"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cers_lesson_attachments", :force => true do |t|
    t.integer  "cers_lesson_id"
    t.integer  "cers_attachment_id"
    t.integer  "attachment_order"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "cers_lesson_attachments", ["cers_attachment_id"], :name => "index_cers_lesson_attachments_on_cers_attachment_id"
  add_index "cers_lesson_attachments", ["cers_lesson_id"], :name => "index_cers_lesson_attachments_on_cers_lesson_id"

  create_table "cers_lesson_videos", :force => true do |t|
    t.integer  "cers_lesson_id"
    t.integer  "cers_video_id"
    t.integer  "video_order"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "cers_lesson_videos", ["cers_lesson_id"], :name => "index_cers_lesson_videos_on_cers_lesson_id"
  add_index "cers_lesson_videos", ["cers_video_id"], :name => "index_cers_lesson_videos_on_cers_video_id"

  create_table "cers_lessons", :force => true do |t|
    t.boolean  "enabled",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "cers_manager_lessons", :force => true do |t|
    t.integer  "cers_course_subject_teacher_id"
    t.integer  "cers_lesson_id"
    t.integer  "lesson_order"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "cers_manager_lessons", ["cers_course_subject_teacher_id"], :name => "index_cers_manager_lessons_on_cers_course_subject_teacher_id"
  add_index "cers_manager_lessons", ["cers_lesson_id"], :name => "index_cers_manager_lessons_on_cers_lesson_id"

  create_table "cers_notice_courses", :force => true do |t|
    t.integer  "cers_notice_id"
    t.integer  "cers_course_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "cers_notice_courses", ["cers_course_id"], :name => "index_cers_notice_courses_on_cers_course_id"
  add_index "cers_notice_courses", ["cers_notice_id"], :name => "index_cers_notice_courses_on_cers_notice_id"

  create_table "cers_notices", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "enabled"
    t.boolean  "all_courses"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cers_products", :force => true do |t|
    t.integer  "itemable_id"
    t.string   "itemable_type"
    t.string   "title"
    t.string   "slug"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.float    "price"
    t.boolean  "can_promote",   :default => true
    t.boolean  "enabled",       :default => true
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "cers_products", ["itemable_id"], :name => "index_cers_products_on_itemable_id"

  create_table "cers_servers", :force => true do |t|
    t.string   "title"
    t.string   "host"
    t.integer  "port"
    t.string   "username"
    t.string   "password"
    t.integer  "media_type", :default => 1
    t.boolean  "enabled",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "cers_student_messages", :force => true do |t|
    t.integer  "cers_student_message_id"
    t.integer  "cers_student_id"
    t.integer  "cers_teacher_id"
    t.integer  "cers_course_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "private"
    t.string   "sender_type"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "cers_student_messages", ["cers_course_id"], :name => "index_cers_student_messages_on_cers_course_id"
  add_index "cers_student_messages", ["cers_student_id"], :name => "index_cers_student_messages_on_cers_student_id"
  add_index "cers_student_messages", ["cers_student_message_id"], :name => "index_cers_student_messages_on_cers_student_message_id"
  add_index "cers_student_messages", ["cers_teacher_id"], :name => "index_cers_student_messages_on_cers_teacher_id"

  create_table "cers_students", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "nickname"
    t.string   "rg"
    t.string   "cpf"
    t.date     "born"
    t.integer  "gender"
    t.string   "address"
    t.string   "number"
    t.string   "complement"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone"
    t.string   "mobile"
    t.boolean  "newsletter_email",    :default => false
    t.boolean  "newsletter_phone",    :default => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "cers_students", ["user_id"], :name => "index_cers_students_on_user_id"

  create_table "cers_subjects", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.boolean  "enabled"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cers_subscriptions", :force => true do |t|
    t.integer  "cers_student_id"
    t.integer  "cers_product_id"
    t.boolean  "canceled"
    t.date     "expiration_at"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "cers_subscriptions", ["cers_product_id"], :name => "index_cers_subscriptions_on_cers_product_id"
  add_index "cers_subscriptions", ["cers_student_id"], :name => "index_cers_subscriptions_on_cers_student_id"

  create_table "cers_teachers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_unity_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "name"
    t.string   "slug"
    t.string   "email_public"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "video"
    t.text     "about"
    t.boolean  "enabled",             :default => true
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "cers_teachers", ["company_unity_id"], :name => "index_cers_teachers_on_company_unity_id"
  add_index "cers_teachers", ["user_id"], :name => "index_cers_teachers_on_user_id"

  create_table "cers_transmission_settings", :force => true do |t|
    t.integer  "transmission_type"
    t.integer  "cers_server_id"
    t.string   "title"
    t.string   "url"
    t.string   "url_html5"
    t.string   "provider"
    t.string   "provider_html5"
    t.boolean  "enabled",           :default => true
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "cers_transmission_settings", ["cers_server_id"], :name => "index_cers_transmission_settings_on_cers_server_id"

  create_table "cers_videos", :force => true do |t|
    t.integer  "cers_transmission_setting_id"
    t.string   "title"
    t.string   "link"
    t.string   "format"
    t.boolean  "enabled",                      :default => true
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "cers_videos", ["cers_transmission_setting_id"], :name => "index_cers_videos_on_cers_transmission_setting_id"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "cms_banners", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.text     "description"
    t.integer  "order"
    t.integer  "hits",               :default => 0
    t.boolean  "enabled",            :default => true
    t.datetime "published_at"
    t.datetime "unpublished_at"
    t.integer  "category_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "cms_banners", ["category_id"], :name => "index_cms_banners_on_category_id"

  create_table "cms_categories", :force => true do |t|
    t.string   "name"
    t.integer  "section_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cms_categories", ["section_id"], :name => "index_cms_categories_on_section_id"

  create_table "cms_downloads", :force => true do |t|
    t.integer  "category_id"
    t.string   "title"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "description"
    t.integer  "order"
    t.integer  "hits",              :default => 0
    t.boolean  "enabled",           :default => true
    t.datetime "published_at"
    t.datetime "unpublished_at"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "cms_downloads", ["category_id"], :name => "index_cms_downloads_on_category_id"

  create_table "cms_news", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "text"
    t.integer  "order"
    t.integer  "hits",               :default => 0
    t.boolean  "enabled",            :default => true
    t.datetime "published_at"
    t.datetime "unpublished_at"
    t.integer  "category_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
    t.integer  "updated_by"
    t.integer  "created_by"
    t.text     "caption"
  end

  add_index "cms_news", ["category_id"], :name => "index_cms_news_on_category_id"
  add_index "cms_news", ["slug"], :name => "index_cms_news_on_slug"

  create_table "cms_sections", :force => true do |t|
    t.string   "name"
    t.string   "model_name"
    t.integer  "domain_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cms_sections", ["domain_id"], :name => "index_cms_sections_on_domain_id"

  create_table "company_employees", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "company_sector_id"
    t.integer  "company_unity_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "company_employees", ["company_sector_id"], :name => "index_company_employees_on_company_sector_id"
  add_index "company_employees", ["company_unity_id"], :name => "index_company_employees_on_company_unity_id"
  add_index "company_employees", ["user_id"], :name => "index_company_employees_on_user_id"

  create_table "company_sectors", :force => true do |t|
    t.string   "title"
    t.boolean  "reply_topic", :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "company_studios", :force => true do |t|
    t.integer  "company_unity_id"
    t.string   "name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "company_studios", ["company_unity_id"], :name => "index_company_studios_on_company_unity_id"

  create_table "company_support_tickets", :force => true do |t|
    t.integer  "company_employee_id"
    t.text     "content"
    t.integer  "status"
    t.integer  "company_support_ticket_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "company_support_tickets", ["company_employee_id"], :name => "index_company_support_tickets_on_company_employee_id"
  add_index "company_support_tickets", ["company_support_ticket_id"], :name => "index_company_support_tickets_on_company_support_ticket_id"

  create_table "company_unities", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "crm_message_forwardings", :force => true do |t|
    t.integer  "forwarder_id"
    t.integer  "from_channel"
    t.integer  "to_channel"
    t.integer  "from_topic_id"
    t.integer  "to_topic_id"
    t.integer  "crm_message_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "crm_message_forwardings", ["crm_message_id"], :name => "index_crm_message_forwardings_on_crm_message_id"
  add_index "crm_message_forwardings", ["forwarder_id"], :name => "index_crm_message_forwardings_on_forwarder_id"
  add_index "crm_message_forwardings", ["from_topic_id"], :name => "index_crm_message_forwardings_on_from_topic_id"
  add_index "crm_message_forwardings", ["to_topic_id"], :name => "index_crm_message_forwardings_on_to_topic_id"

  create_table "crm_messages", :force => true do |t|
    t.integer  "crm_message_id"
    t.integer  "domain_id"
    t.integer  "crm_sector_topic_id"
    t.integer  "company_employee_id"
    t.integer  "cers_student_id"
    t.integer  "cers_teacher_id"
    t.integer  "cers_course_id"
    t.integer  "cers_video_id"
    t.integer  "crm_video_issue_topic_id"
    t.string   "name"
    t.string   "email"
    t.string   "title"
    t.string   "private"
    t.string   "provider"
    t.string   "connection_speed"
    t.string   "connection_type"
    t.string   "time_of_occurrence"
    t.string   "sender_type"
    t.string   "code"
    t.text     "content"
    t.text     "specs"
    t.integer  "channel"
    t.integer  "status"
    t.boolean  "use_router"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "crm_messages", ["cers_course_id"], :name => "index_crm_messages_on_cers_course_id"
  add_index "crm_messages", ["cers_student_id"], :name => "index_crm_messages_on_cers_student_id"
  add_index "crm_messages", ["cers_teacher_id"], :name => "index_crm_messages_on_cers_teacher_id"
  add_index "crm_messages", ["cers_video_id"], :name => "index_crm_messages_on_cers_video_id"
  add_index "crm_messages", ["company_employee_id"], :name => "index_crm_messages_on_company_employee_id"
  add_index "crm_messages", ["crm_message_id"], :name => "index_crm_messages_on_crm_message_id"
  add_index "crm_messages", ["crm_sector_topic_id"], :name => "index_crm_messages_on_crm_sector_topic_id"
  add_index "crm_messages", ["crm_video_issue_topic_id"], :name => "index_crm_messages_on_crm_video_issue_topic_id"
  add_index "crm_messages", ["domain_id"], :name => "index_crm_messages_on_domain_id"

  create_table "crm_sector_topics", :force => true do |t|
    t.integer  "company_sector_id"
    t.string   "topic"
    t.boolean  "public",            :default => true
    t.boolean  "enabled",           :default => true
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "crm_sector_topics", ["company_sector_id"], :name => "index_crm_sector_topics_on_company_sector_id"

  create_table "crm_video_issue_topics", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "domains", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "directory"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "contact_url"
  end

  create_table "financial_duties", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "financial_duty_models", :force => true do |t|
    t.integer  "financial_duty_id"
    t.string   "model_name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "financial_duty_models", ["financial_duty_id"], :name => "index_financial_duty_models_on_financial_duty_id"

  create_table "financial_student_credits", :force => true do |t|
    t.integer  "cers_student_id"
    t.integer  "cers_subscription_from_id"
    t.integer  "cers_subscription_to_id"
    t.float    "value"
    t.float    "value_used"
    t.boolean  "status"
    t.datetime "until_at"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "financial_student_credits", ["cers_student_id"], :name => "index_financial_student_credits_on_cers_student_id"
  add_index "financial_student_credits", ["cers_subscription_from_id"], :name => "index_financial_student_credits_on_cers_subscription_from_id"
  add_index "financial_student_credits", ["cers_subscription_to_id"], :name => "index_financial_student_credits_on_cers_subscription_to_id"

  create_table "financial_student_discounts", :force => true do |t|
    t.integer  "cers_student_id"
    t.integer  "cers_product_id"
    t.float    "discount"
    t.datetime "due_date_at"
    t.integer  "sale_shopping_cart_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "financial_student_discounts", ["cers_product_id"], :name => "index_financial_student_discounts_on_cers_product_id"
  add_index "financial_student_discounts", ["cers_student_id"], :name => "index_financial_student_discounts_on_cers_student_id"
  add_index "financial_student_discounts", ["sale_shopping_cart_id"], :name => "index_financial_student_discounts_on_sale_shopping_cart_id"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "role_permissions", :force => true do |t|
    t.integer  "role_id"
    t.string   "regulator"
    t.string   "conduct"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "role_permissions", ["role_id"], :name => "index_role_permissions_on_role_id"

  create_table "role_roles", :force => true do |t|
    t.integer  "role_id"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sale_campaigns", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sale_coupons", :force => true do |t|
    t.integer  "sale_campaign_id"
    t.string   "name"
    t.integer  "percentage"
    t.string   "code"
    t.datetime "release_at"
    t.datetime "expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "sale_coupons", ["sale_campaign_id"], :name => "index_sale_coupons_on_sale_campaign_id"

  create_table "sale_invoices", :force => true do |t|
    t.datetime "transaction_date"
    t.integer  "status"
    t.text     "reason"
    t.integer  "sale_shopping_cart_id"
    t.integer  "cers_student_id"
    t.integer  "company_employee_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "sale_invoices", ["cers_student_id"], :name => "index_sale_invoices_on_cers_student_id"
  add_index "sale_invoices", ["company_employee_id"], :name => "index_sale_invoices_on_company_employee_id"
  add_index "sale_invoices", ["sale_shopping_cart_id"], :name => "index_sale_invoices_on_sale_shopping_cart_id"

  create_table "sale_item_prices", :force => true do |t|
    t.string   "title"
    t.integer  "cers_product_id"
    t.float    "discount"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "enabled"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "sale_item_prices", ["cers_product_id"], :name => "index_sale_item_prices_on_cers_product_id"

  create_table "sale_offer_products", :force => true do |t|
    t.integer  "sale_offer_id"
    t.integer  "cers_product_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "sale_offer_products", ["cers_product_id"], :name => "index_sale_offer_products_on_cers_product_id"
  add_index "sale_offer_products", ["sale_offer_id"], :name => "index_sale_offer_products_on_sale_offer_id"

  create_table "sale_offer_rules", :force => true do |t|
    t.integer  "sale_offer_id"
    t.string   "comparative_symbol"
    t.integer  "quantity"
    t.float    "discount"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "sale_offer_rules", ["sale_offer_id"], :name => "index_sale_offer_rules_on_sale_offer_id"

  create_table "sale_offers", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "enabled"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sale_order_items", :force => true do |t|
    t.integer  "sale_order_id"
    t.integer  "cers_product_id"
    t.float    "price"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "sale_order_items", ["cers_product_id"], :name => "index_sale_order_items_on_cers_product_id"
  add_index "sale_order_items", ["sale_order_id"], :name => "index_sale_order_items_on_sale_order_id"

  create_table "sale_orders", :force => true do |t|
    t.integer  "sale_invoice_id"
    t.integer  "financial_duty_id"
    t.float    "order_price"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "sale_orders", ["financial_duty_id"], :name => "index_sale_orders_on_financial_duty_id"
  add_index "sale_orders", ["sale_invoice_id"], :name => "index_sale_orders_on_sale_invoice_id"

  create_table "sale_package_items", :force => true do |t|
    t.integer  "sale_package_id"
    t.integer  "cers_product_id"
    t.float    "discount"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "sale_package_items", ["cers_product_id"], :name => "index_sale_package_items_on_cers_product_id"
  add_index "sale_package_items", ["sale_package_id"], :name => "index_sale_package_items_on_sale_package_id"

  create_table "sale_packages", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "enabled"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sale_shopping_cart_items", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "quantity"
    t.integer  "item_id"
    t.string   "item_type"
    t.float    "price"
    t.boolean  "nf",                :default => true
    t.integer  "financial_duty_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "sale_shopping_cart_items", ["financial_duty_id"], :name => "index_sale_shopping_cart_items_on_financial_duty_id"

  create_table "sale_shopping_carts", :force => true do |t|
    t.integer  "cers_student_id"
    t.boolean  "purchased",       :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "sale_shopping_carts", ["cers_student_id"], :name => "index_sale_shopping_carts_on_cers_student_id"

  create_table "shortened_urls", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type", :limit => 20
    t.string   "url",                                     :null => false
    t.string   "unique_key", :limit => 10,                :null => false
    t.integer  "use_count",                :default => 0, :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "shortened_urls", ["owner_id", "owner_type"], :name => "index_shortened_urls_on_owner_id_and_owner_type"
  add_index "shortened_urls", ["unique_key"], :name => "index_shortened_urls_on_unique_key", :unique => true
  add_index "shortened_urls", ["url"], :name => "index_shortened_urls_on_url"

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_roles", ["role_id"], :name => "index_user_roles_on_role_id"
  add_index "user_roles", ["user_id"], :name => "index_user_roles_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "login_token"
    t.string   "old_pass"
    t.boolean  "pass_status",            :default => true
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

  create_table "workflow_holidays", :force => true do |t|
    t.string   "title"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "workflow_schedules", :force => true do |t|
    t.integer  "cers_video_id"
    t.integer  "cers_teacher_id"
    t.integer  "cers_lesson_id"
    t.integer  "company_studio_id"
    t.integer  "parent_id"
    t.text     "observation"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "status"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "workflow_schedules", ["cers_lesson_id"], :name => "index_workflow_schedules_on_cers_lesson_id"
  add_index "workflow_schedules", ["cers_teacher_id"], :name => "index_workflow_schedules_on_cers_teacher_id"
  add_index "workflow_schedules", ["cers_video_id"], :name => "index_workflow_schedules_on_cers_video_id"
  add_index "workflow_schedules", ["company_studio_id"], :name => "index_workflow_schedules_on_company_studio_id"
  add_index "workflow_schedules", ["parent_id"], :name => "index_workflow_schedules_on_parent_id"

end
