class CreateSiteDesign < ActiveRecord::Migration[5.0]
  def change
  # create_table "multisite_sidebars", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
  #   t.integer  "site_id",                             unsigned: true
  #   t.string   "subtitle",              limit: 64
  #   t.string   "facebook_like_box_url", limit: 128
  #   t.string   "title",                 limit: 128
  #   t.text     "content",               limit: 65535
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end

  create_table "multisite_site_designs", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.references :multisite_site, foreign_key: true, unsigned: true 
    t.attachment :logo
    t.attachment :banner
    t.string   "title",           limit: 64
    t.string   "subtitle",        limit: 64
    t.string   "facebook_url",    limit: 128
    t.string   "twitter_url",     limit: 128
    t.string   "layout",          limit: 24
    t.string   "theme",           limit: 24
    t.string   "color1",          limit: 7
    t.string   "color2",          limit: 7
    t.string   "sidebar_title",   limit: 128
    t.text     "sidebar_content", limit: 65535
    t.boolean  "global_sidebar",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  end
end
