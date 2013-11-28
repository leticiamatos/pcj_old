class Blog::Blog < ActiveRecord::Base

	belongs_to :domain
	# belongs_to :admin, :foreign_key => :user_admin_id, :class_name => User
	# belongs_to :user, :foreign_key => :user_id, :class_name => User

	default_scope where(domain_id: ApplicationController::DOMAIN_ID)

	attr_accessible :domain_id, :user_id, :user_admin_id, :description

	validates_presence_of :domain_id, :user_id

end
