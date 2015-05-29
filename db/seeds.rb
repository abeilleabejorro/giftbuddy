# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


seph = User.create(name: "Seph", email: "sephkramer@example.com", password: "flatiron")

sam = User.create(name: "Sam", email: "sam@example.com", password: "flatiron")

emily = User.create(name: "Emily", email: "emily@example.com", password: "flatiron")

new_purse = Campaign.create(title: "I need a new fancy purse", photo_url: "http://content.purseblog.com/images/2010/05/Louis-Vuitton-Speedy.jpg", deadline: Time.now+(1 * 60 * 60 * 24), total: 1000, description:"I reaaaally really really really want a new purse to help me look fancy out on the town.", status: "Pending" )

new_purse.receiver_id = emily.id

new_purse.save

seph_pledge = Pledge.create(amount: 10, campaign_id: new_purse.id, giver_id: seph.id)

sam_pledge = Pledge.create(amount: 1000, campaign_id: new_purse.id, giver_id: sam.id)

new_purse.pledges << seph_pledge
new_purse.pledges << sam_pledge


new_tv = Campaign.create(title: "Big screen TV please!", photo_url: "http://www.samsung.com/us/2012-smart-blu-ray-player/img/tv-front.png", deadline: Time.now+(7 * 60 * 60 * 24), total: 700, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", status: "Pending" )
new_tv.receiver_id = seph.id
new_tv.save

new_tv.pledges << seph_pledge
new_tv.pledges << sam_pledge

new_pool = Campaign.create(title: "Above Ground Pool", photo_url: "http://emeraldoutdoorliving.com/wp-content/uploads/2012/03/DoughBoySwimmingPools_PresitgeOv.jpg", deadline: Time.now+(2 * 60 * 60 * 24), total: 1400, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", status: "Pending" )
new_pool.receiver_id = sam.id
new_pool.save

new_pool.pledges << seph_pledge
new_pool.pledges << sam_pledge


franco = User.create(name: "Franco", email: "franco@example.com", password: "flatiron")
josh = User.create(name: "Josh", email: "josh@example.com", password: "flatiron")
chad = User.create(name: "Chad", email: "chad@example.com", password: "flatiron")


new_box = Campaign.create(title: "A big box with a bow on it", photo_url: "/gift-1.jpg", deadline: Time.now+(2 * 60 * 60 * 24), total: 50, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", status: "Pending" )
new_box.receiver_id = josh.id
new_box.save

new_jeans = Campaign.create(title: "New skinny jeans", photo_url: "http://cdna.the-lust-list.co.uk/wp-content/uploads/2014/02/69E14GBLK_large.jpg", deadline: Time.now+(2 * 60 * 60 * 24), total: 100, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", status: "Pending" )
new_jeans.receiver_id = franco.id
new_jeans.save

new_car = Campaign.create(title: "A Tesla!", deadline: Time.now+(10 * 60 * 60 * 24), photo_url: "http://assets.inhabitat.com/wp-content/blogs.dir/1/files/2013/06/Tesla-Model-S-537x301.jpg", total: 25000, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", status: "Pending" )
new_car.receiver_id = chad.id
new_car.save

