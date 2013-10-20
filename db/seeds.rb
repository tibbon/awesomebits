# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Set up the admin user
user = User.find_or_create_by_first_name_and_last_name_and_email("Awesome", "Admin", "admin@awesomefoundation.org")
user.update_attribute(:admin, true)
user.update_password("gnarly")

# Set up the "Any" Chapter
Chapter.find_or_create_by_name("Any", :description => "Any Chapter", :country => COUNTRY_PRIORITY.first)

Project.find_or_create_by_name("David\'s Flamethrower", url: 'http://example.org/flamethrower', email: 'david@example.com', phone: '888-555-1212', about_me: "I like flamethrowers.", chapter_id: Chapter.first.id, about_project: "I want to make a big flamethrower.", title: "Awesome flamethrower", funded_on: '2013-12-11', rss_feed_url: "https://github.com/tibbon.atom", use_for_money: "Making awesome by making flamethrowers", funded_description: "Awesome description flamethrowers")
Project.find_or_create_by_name("Erhardt\'s Orphan", url: 'http://example.org/orphan', email: 'erhardt@example.com', phone: '888-555-2121', about_me: "I like saving orphans.", chapter_id: Chapter.first.id, about_project: "I want to save orphans.", title: "Awesome orphan saver", funded_on: '2013-10-11', rss_feed_url: "https://github.com/tibbon.atom", use_for_money: "Making awesome by saving orphans", funded_description: "Awesome description orphan")