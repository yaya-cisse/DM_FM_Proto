# create_table "morpheus_files", :force => true do |t|
#   t.integer  "associable_file_id"
#   t.string   "associable_file_type"
#   t.string   "filename"
#   t.string   "type"
#   t.binary   "content",              :limit => 16777215
#   t.datetime "created_at",                               :null => false
#   t.datetime "updated_at",                               :null => false
# end
class MorpheusFile < ActiveRecord::Base
end
