# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

products = Cers::Product.unscoped.joins(:domains).where("domain_id = 4")

products.each do |product|
	new_tag_list = product.itemable.tag_list.add("pcj").to_s
	product.itemable.update_attributes(:tag_list => new_tag_list)
end