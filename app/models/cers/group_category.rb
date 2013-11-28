class Cers::GroupCategory < ActiveRecord::Base
    belongs_to :cers_category, :class_name => Cers::Category
    belongs_to :cers_group,    :class_name => Cers::Group
end
