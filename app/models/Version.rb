# create_table "versions", :force => true do |t|
#   t.string   "name"
#   t.datetime "created_at",                                                                 :null => false
#   t.datetime "updated_at",                                                                 :null => false
#   t.string   "kind"
#   t.integer  "user_id"
#   t.boolean  "public",                                                  :default => false, :null => false
#   t.integer  "versionable_id"
#   t.string   "versionable_type"
#   t.decimal  "number",                  :precision => 15, :scale => 10
#   t.string   "cloud_app_name"
#   t.decimal  "cloud_app_version",       :precision => 15, :scale => 10
#   t.boolean  "complete_component_name"
#   t.integer  "priority",                                                :default => 0
#   t.boolean  "activate_debug"
#   t.string   "cloud_id"
#   t.text     "hash_config"
#   t.string   "smart_unique_key"
#   t.string   "full_name"
#   t.boolean  "hidden_version",                                          :default => false
#   t.text     "dynamic_list_config"
# end
class Version < ActiveRecord::Base
end
