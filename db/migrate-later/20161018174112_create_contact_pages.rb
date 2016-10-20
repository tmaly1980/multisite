class CreateContactPages < ActiveRecord::Migration[5.0]
  def change
  create_table "multisite_contact_pages", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "site_id",                unsigned: true
    t.string   "phone",      limit: 24
    t.string   "email",      limit: 64
    t.string   "address",    limit: 128
    t.string   "address_2",  limit: 128
    t.string   "city",       limit: 32
    t.string   "state",      limit: 32
    t.string   "country",    limit: 32
    t.string   "zip_code",   limit: 8
    t.boolean  "show_map"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  create_table "contacts", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",            limit: 64
    t.string   "title",           limit: 64
    t.string   "phone",           limit: 24
    t.string   "alternate_phone", limit: 16
    t.string   "email",           limit: 64
    t.text     "details",         limit: 65535
    t.integer  "ix",                            unsigned: true
    t.datetime "created_at"
    t.datetime "modified_at"
    t.integer  "site_id",                     unsigned: true
  end


  end
end
