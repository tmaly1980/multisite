class CreateSites < ActiveRecord::Migration[5.0]
  def change

  create_table "multisite_sites", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "hostname",           limit: 24
    t.integer  "user_id",                                                     unsigned: true
    t.string   "title",              limit: 64

    t.string   "plan",               limit: 36
    t.string   "stripe_id",          limit: 128
    t.string   "subscription_id",    limit: 128
    t.string   "domain",             limit: 64
    t.boolean  "internal",                       default: false, null: false
    t.boolean  "trial",                          default: false, null: false
    t.datetime "upgraded"
    t.string   "session_id",         limit: 128
    t.integer  "marketing_visit_id",                                          unsigned: true
    t.datetime "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  end
end
