# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


seph = User.create(name: "Seph", email: "sephkramer@example.com")

sam = User.create(name: "Sam", email: "sam@example.com")

emily = User.create(name: "Emily", email: "emily@example.com")

new_purse = Campaign.create(description: "I need a new fancy purse", photo_url: "http://content.purseblog.com/images/2010/05/Louis-Vuitton-Speedy.jpg", deadline: Time.now, total: 1000 )

new_purse.receiver_id = emily.id

new_purse.save

seph_pledge = Pledge.create(amount: 10, campaign_id: new_purse.id, giver_id: seph.id)

sam_pledge = Pledge.create(amount: 1000, campaign_id: new_purse.id, giver_id: sam.id)

new_purse.pledges << seph_pledge
new_purse.pledges << sam_pledge




# franco = User.create(name: 'Franco', email: 'franco@example.com')
# josh = User.create(name: 'Josh', email: 'josh@example.com')
# simone = User.create(name: 'Simone', email: 'simone@example.com')

# big_screen = Campaign.create(description: 'I need a new TV', photo_url: 'https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0CAcQjRw&url=http%3A%2F%2Fwww.mymcpl.org%2Fblog-tags%2Ftelevision%2520shows&ei=vmxfVY_8G9LasAS0sYD4Bw&bvm=bv.93990622,d.cWc&psig=AFQjCNGMBC5psL9OuytoEzfE97Omn83kqQ&ust=1432403523265440')



# ActiveRecord::Schema.define(version: 20150522173432) do

#   create_table "campaigns", force: :cascade do |t|
#     t.text     "description"
#     t.string   "photo_url"
#     t.datetime "deadline"
#     t.integer  "total"
#     t.datetime "created_at",  null: false
#     t.datetime "updated_at",  null: false
#     t.integer  "receiver_id"
#   end

#   create_table "pledges", force: :cascade do |t|
#     t.integer  "amount"
#     t.integer  "campaign_id"
#     t.datetime "created_at",  null: false
#     t.datetime "updated_at",  null: false
#     t.integer  "giver_id"
#   end

#   add_index "pledges", ["campaign_id"], name: "index_pledges_on_campaign_id"

#   create_table "users", force: :cascade do |t|
#     t.string   "name"
#     t.string   "email"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

# end



