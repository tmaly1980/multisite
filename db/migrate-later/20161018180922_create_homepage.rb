class CreateHomepage < ActiveRecord::Migration[5.0]
  def change
  create_table "multisite_homepages", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "site_id",                         unsigned: true
    t.string   "title",             limit: 64
    t.attachment :photo
    t.text     "introduction",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_like_url", limit: 250
  end

  end
end
