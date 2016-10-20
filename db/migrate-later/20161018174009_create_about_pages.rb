class CreateAboutPages < ActiveRecord::Migration[5.0]
  def change
  create_table "multisite_about_pages", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "site_id",                      unsigned: true
    t.attachment :photo
    t.text     "about",          limit: 65535
    t.text     "history",        limit: 65535
    t.text     "content",        limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  create_table "about_page_bios", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",          limit: 64
    t.string   "title",         limit: 64
    t.integer  "site_id",                      unsigned: true
    t.attachment :photo
    t.text     "description",   limit: 65535
    t.integer  "ix",                          unsigned: true
    t.datetime "created_at"
    t.datetime "modified_at"
  end



  end
end
