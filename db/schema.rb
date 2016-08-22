# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160708130505) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "token"
    t.string   "environment"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.boolean  "save_data_notification",   :default => false
    t.integer  "max_week_notification",    :default => 4
    t.boolean  "poke_activate"
    t.boolean  "activate_smart_link"
    t.boolean  "priority_merge_config_dm"
    t.boolean  "activate_merge_campaign"
  end

  add_index "accounts", ["name"], :name => "index_accounts_on_name", :unique => true

  create_table "accounts_visible_tickets", :force => true do |t|
    t.integer  "account_id"
    t.integer  "ticket_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "accounts_visible_tickets", ["account_id"], :name => "index_accounts_visible_tickets_on_account_id"
  add_index "accounts_visible_tickets", ["ticket_id"], :name => "index_accounts_visible_tickets_on_ticket_id"

  create_table "action_flow_asset_action_statuses", :force => true do |t|
    t.integer  "targeted_asset_id"
    t.integer  "action_flow_asynchronous_action_id"
    t.string   "aasm_state"
    t.string   "dependency_status"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "triggers_status"
    t.text     "parameters"
    t.text     "results"
    t.integer  "action_flow_targeted_asset_definition_id"
  end

  add_index "action_flow_asset_action_statuses", ["action_flow_asynchronous_action_id", "targeted_asset_id"], :name => "action_flow_asset_asction_status_uniqueness", :unique => true
  add_index "action_flow_asset_action_statuses", ["action_flow_asynchronous_action_id"], :name => "action_flow_statuses_action_id"
  add_index "action_flow_asset_action_statuses", ["action_flow_targeted_asset_definition_id"], :name => "action_flow_asset_action_status_def_id"
  add_index "action_flow_asset_action_statuses", ["targeted_asset_id"], :name => "action_flow_statuses_targeted_asset_id"

  create_table "action_flow_asset_trigger_statuses", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "action_flow_trigger_id"
    t.string   "aasm_state",                               :default => "sleeping", :null => false
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.integer  "action_flow_targeted_asset_definition_id"
  end

  add_index "action_flow_asset_trigger_statuses", ["aasm_state"], :name => "index_action_flow_asset_trigger_statuses_on_aasm_state"
  add_index "action_flow_asset_trigger_statuses", ["action_flow_targeted_asset_definition_id"], :name => "action_flow_asset_action_status_def_id"
  add_index "action_flow_asset_trigger_statuses", ["action_flow_trigger_id"], :name => "action_flow_statuses_trigger_id"
  add_index "action_flow_asset_trigger_statuses", ["asset_id"], :name => "action_flow_statuses_asset_id"

  create_table "action_flow_asynchronous_actions", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "action_type"
    t.text     "parameters"
    t.integer  "action_id"
    t.integer  "action_on_ended_id"
    t.string   "name"
    t.string   "triggers_behavior"
  end

  create_table "action_flow_definitions", :force => true do |t|
    t.string   "aasm_state"
    t.integer  "asset_id"
    t.datetime "timeout_date"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "account_id"
    t.text     "worker_id"
  end

  add_index "action_flow_definitions", ["asset_id"], :name => "index_action_flow_definitions_on_asset_id"

  create_table "action_flow_dependent_actions", :force => true do |t|
    t.integer  "dependent_action_id"
    t.integer  "children_dependent_action_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "action_flow_dependent_actions", ["children_dependent_action_id"], :name => "action_flow_children_dependent_action_id"
  add_index "action_flow_dependent_actions", ["dependent_action_id"], :name => "action_flow_dependent_action_id"

  create_table "action_flow_targeted_asset_definitions", :force => true do |t|
    t.integer  "targeted_asset_id"
    t.integer  "action_flow_definition_id"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.string   "aasm_state",                                    :default => "sleeping", :null => false
    t.text     "global_parameters",         :limit => 16777215,                         :null => false
    t.text     "logs",                      :limit => 16777215,                         :null => false
    t.integer  "progression",                                   :default => 0
  end

  add_index "action_flow_targeted_asset_definitions", ["action_flow_definition_id"], :name => "action_flow_definition_id"
  add_index "action_flow_targeted_asset_definitions", ["targeted_asset_id"], :name => "action_flow_targeted_asset_id"

  create_table "action_flow_triggers", :force => true do |t|
    t.integer  "action_flow_asynchronous_action_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.text     "parameters"
    t.string   "trigger_type"
    t.string   "name"
  end

  create_table "app_environment_definitions", :force => true do |t|
    t.integer  "app_id"
    t.string   "environment"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "cloud_id"
  end

  add_index "app_environment_definitions", ["app_id"], :name => "index_app_environment_definitions_on_app_id"

  create_table "applied_configurations", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "asset_configuration_id"
    t.datetime "applied_configuration_date"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "applied_configurations", ["asset_id"], :name => "index_applied_configurations_on_asset_id"

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "is_configurable", :default => false
    t.text     "description"
  end

  create_table "asset_assets_groups", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "assets_group_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "asset_assets_groups", ["asset_id"], :name => "index_asset_assets_groups_on_asset_id"
  add_index "asset_assets_groups", ["assets_group_id"], :name => "index_asset_assets_groups_on_assets_group_id"

  create_table "asset_campaigns", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "campaign_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "status"
    t.integer  "update_type",   :default => 0
    t.text     "logs_campaign"
    t.integer  "retry"
    t.integer  "version_id"
    t.string   "cloud_id",      :default => ""
  end

  add_index "asset_campaigns", ["asset_id"], :name => "index_asset_campaigns_on_asset_id"
  add_index "asset_campaigns", ["campaign_id"], :name => "index_asset_campaigns_on_campaign_id"
  add_index "asset_campaigns", ["status"], :name => "index_asset_campaigns_on_status"

  create_table "asset_configurations", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                                                                 :null => false
    t.datetime "updated_at",                                                                 :null => false
    t.string   "user_id"
    t.integer  "account_id"
    t.integer  "clonings_count",                                          :default => 0,     :null => false
    t.boolean  "locked",                                                  :default => false, :null => false
    t.integer  "version_id"
    t.text     "data"
    t.text     "signatures"
    t.integer  "parent_id"
    t.boolean  "is_multiconfig",                                          :default => false
    t.boolean  "is_system_config",                                        :default => false
    t.text     "logs",                                :limit => 16777215
    t.integer  "parent_configuration_association_id"
  end

  add_index "asset_configurations", ["account_id", "is_multiconfig", "is_system_config"], :name => "idx_cover_asset_config"
  add_index "asset_configurations", ["account_id", "is_multiconfig", "is_system_config"], :name => "test"
  add_index "asset_configurations", ["account_id"], :name => "index_asset_configurations_on_account_id"
  add_index "asset_configurations", ["parent_id"], :name => "idx_parent_configuration"
  add_index "asset_configurations", ["version_id"], :name => "index_asset_configurations_on_version_id"

  create_table "asset_configurations_parent_configuration_associations", :id => false, :force => true do |t|
    t.integer "asset_configuration_id"
    t.integer "parent_configuration_association_id"
  end

  create_table "asset_management_driver_profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "gender"
    t.date     "birthday"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "account_id"
    t.integer  "user_id"
  end

  add_index "asset_management_driver_profiles", ["account_id"], :name => "index_asset_management_driver_profiles_on_account_id"
  add_index "asset_management_driver_profiles", ["email"], :name => "index_asset_management_driver_profiles_on_email", :unique => true
  add_index "asset_management_driver_profiles", ["user_id"], :name => "index_asset_management_driver_profiles_on_user_id"

  create_table "asset_management_vehicles", :force => true do |t|
    t.string   "plate"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.integer  "driver_profile_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "fuel_type"
    t.integer  "engine_displacement"
    t.integer  "account_id"
    t.integer  "user_id"
  end

  add_index "asset_management_vehicles", ["account_id"], :name => "index_asset_management_vehicles_on_account_id"
  add_index "asset_management_vehicles", ["plate"], :name => "index_asset_management_vehicles_on_plate", :unique => true
  add_index "asset_management_vehicles", ["user_id"], :name => "index_asset_management_vehicles_on_user_id"

  create_table "asset_modules", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "asset_settings", :force => true do |t|
    t.boolean  "show_asset_group",      :default => true
    t.boolean  "show_current_conf",     :default => true
    t.boolean  "show_last_activity",    :default => true
    t.boolean  "show_os_version",       :default => true
    t.boolean  "show_modules_version",  :default => true
    t.integer  "user_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "default_action_button"
  end

  create_table "asset_software_updates", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "campaign_id"
    t.integer  "version_id"
  end

  create_table "assets", :force => true do |t|
    t.string   "imei"
    t.datetime "last_date_reported"
    t.datetime "created_at",                                                                    :null => false
    t.datetime "updated_at",                                                                    :null => false
    t.integer  "account_id"
    t.decimal  "last_longitude",              :precision => 10, :scale => 6
    t.decimal  "last_latitude",               :precision => 10, :scale => 6
    t.string   "status"
    t.datetime "last_activity_at"
    t.integer  "assets_group_id"
    t.integer  "version_id"
    t.integer  "user_id"
    t.boolean  "locked",                                                     :default => false, :null => false
    t.datetime "locked_at"
    t.datetime "unlocked_at"
    t.integer  "base_configuration_id"
    t.boolean  "invalidate_configuration"
    t.string   "current_know_sig_g"
    t.string   "current_know_sig_w"
    t.text     "remote_files"
    t.text     "applied_apps"
    t.string   "label"
    t.integer  "asset_management_vehicle_id"
  end

  add_index "assets", ["account_id", "last_date_reported"], :name => "index_assets_on_account_id_and_last_date_reported"
  add_index "assets", ["account_id"], :name => "index_assets_on_account_id"
  add_index "assets", ["asset_management_vehicle_id"], :name => "index_assets_on_asset_management_vehicle_id", :unique => true
  add_index "assets", ["assets_group_id"], :name => "index_assets_on_asset_group_id"
  add_index "assets", ["imei", "account_id"], :name => "index_assets_on_imei_and_account_id", :unique => true
  add_index "assets", ["user_id"], :name => "index_assets_on_user_id"
  add_index "assets", ["version_id"], :name => "index_assets_on_version_id"

  create_table "assets_group_campaigns", :force => true do |t|
    t.integer  "assets_group_id"
    t.integer  "campaign_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "assets_group_campaigns", ["assets_group_id"], :name => "index_assets_group_campaigns_on_assets_group_id"
  add_index "assets_group_campaigns", ["campaign_id"], :name => "index_assets_group_campaigns_on_campaign_id"

  create_table "assets_groups", :force => true do |t|
    t.string   "name"
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "assets_groups", ["user_id"], :name => "index_assets_groups_on_user_id"

  create_table "campaigns", :force => true do |t|
    t.integer  "asset_remaining"
    t.integer  "asset_updated"
    t.string   "status"
    t.integer  "asset_configuration_id"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.integer  "account_id"
    t.string   "state"
    t.datetime "sent_at"
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "ignore_last_campaign"
    t.boolean  "force_update"
    t.integer  "update_type",                        :default => 0
    t.integer  "asset_software_update_id"
    t.boolean  "is_system_config",                   :default => false
    t.boolean  "is_archived",                        :default => false
    t.boolean  "migrate_configurations_and_modules"
    t.integer  "action_flow_definition_id"
    t.string   "asset_software_update_type",         :default => "os"
  end

  add_index "campaigns", ["account_id", "state"], :name => "index_campaigns_on_account_id_and_state"
  add_index "campaigns", ["account_id"], :name => "index_campaigns_on_account_id"
  add_index "campaigns", ["action_flow_definition_id"], :name => "index_campaigns_on_action_flow_definition_id"
  add_index "campaigns", ["asset_configuration_id"], :name => "index_campaigns_on_asset_configuration_id"
  add_index "campaigns", ["asset_software_update_id"], :name => "index_campaigns_on_asset_software_update_id"
  add_index "campaigns", ["user_id"], :name => "index_campaigns_on_user_id"

  create_table "components", :force => true do |t|
    t.string   "name"
    t.boolean  "global",             :default => false, :null => false
    t.integer  "componentable_id"
    t.string   "componentable_type"
    t.integer  "version_id"
    t.integer  "account_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "components", ["account_id"], :name => "index_components_on_account_id"
  add_index "components", ["componentable_id", "componentable_type"], :name => "index_components_on_componentable_id_and_componentable_type"
  add_index "components", ["version_id"], :name => "index_components_on_version_id"

  create_table "configuration_modules", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "asset_module_id"
    t.integer  "asset_configuration_id"
  end

  add_index "configuration_modules", ["asset_configuration_id"], :name => "index_configuration_modules_on_asset_configuration_id"
  add_index "configuration_modules", ["asset_module_id"], :name => "index_configuration_modules_on_asset_module_id"

  create_table "configuration_modules_versions", :force => true do |t|
    t.integer  "configuration_module_id"
    t.integer  "authorized_version_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "configuration_modules_versions", ["authorized_version_id"], :name => "index_configuration_modules_versions_on_authorized_version_id"
  add_index "configuration_modules_versions", ["configuration_module_id"], :name => "index_configuration_modules_versions_on_configuration_module_id"

  create_table "configurations_versions", :force => true do |t|
    t.integer  "asset_configuration_id"
    t.integer  "authorized_version_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "configurations_versions", ["asset_configuration_id"], :name => "index_configurations_versions_on_asset_configuration_id"
  add_index "configurations_versions", ["authorized_version_id"], :name => "index_configurations_versions_on_authorized_version_id"

  create_table "core_os", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "environment"
    t.string   "cloud_id"
    t.text     "description"
  end

  create_table "daily_stat_assets", :force => true do |t|
    t.integer  "nb_message_received"
    t.integer  "total_size_message"
    t.integer  "nb_tracking_received"
    t.integer  "total_size_tracking"
    t.integer  "date_key"
    t.integer  "asset_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "nb_presence_received"
    t.integer  "total_size_presence"
  end

  add_index "daily_stat_assets", ["asset_id", "date_key"], :name => "by_date_and_asset", :unique => true

  create_table "dashboard_settings", :force => true do |t|
    t.boolean  "show_consumption_panel",    :default => true
    t.boolean  "show_version_panel",        :default => false
    t.boolean  "show_inactive_asset_panel", :default => true
    t.boolean  "show_active_asset_panel",   :default => true
    t.integer  "user_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "documentation_pages", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "content"
    t.text     "compiled_content"
    t.integer  "parent_id"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "permissions"
  end

  create_table "documentation_screenshots", :force => true do |t|
    t.string "alt_text"
  end

  create_table "dynamic_forms", :force => true do |t|
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "version_id"
    t.string   "name"
    t.integer  "form_type"
    t.string   "remote_url"
    t.string   "input_data"
    t.boolean  "is_entry"
    t.string   "channel"
    t.integer  "timeout"
    t.boolean  "store_as_user_message"
    t.integer  "ttl_msg_history"
    t.boolean  "manage_msg_pack"
    t.boolean  "authorize_multi_msg"
    t.integer  "form_timeout"
    t.boolean  "msg_wait_response"
    t.string   "rfs_namespace"
  end

  add_index "dynamic_forms", ["version_id"], :name => "index_dynamic_forms_on_version_id"

  create_table "global_settings", :force => true do |t|
    t.string   "csv_separator", :default => ","
    t.integer  "user_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "installed_versions", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "version_id"
    t.datetime "installed_version_date"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "message_histories", :force => true do |t|
    t.integer  "asset_id"
    t.string   "cloud_id"
    t.string   "cloud_thread_id"
    t.integer  "source"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "dynamic_form_id"
    t.boolean  "is_msgpack"
    t.integer  "user_id"
    t.string   "type_msg"
    t.integer  "version_id"
    t.datetime "received_at"
  end

  add_index "message_histories", ["asset_id", "cloud_thread_id"], :name => "index_message_histories_on_asset_id_and_cloud_thread_id"
  add_index "message_histories", ["asset_id"], :name => "index_message_histories_on_asset_id"
  add_index "message_histories", ["cloud_id"], :name => "index_message_histories_on_cloud_id"
  add_index "message_histories", ["cloud_thread_id"], :name => "index_message_histories_on_cloud_thread_id"
  add_index "message_histories", ["dynamic_form_id"], :name => "index_message_histories_on_dynamic_form_id"
  add_index "message_histories", ["user_id"], :name => "index_message_histories_on_user_id"

  create_table "migration_configuration_definitions", :force => true do |t|
    t.integer  "from_version_id"
    t.integer  "to_version_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "migration_configuration_definitions", ["from_version_id", "to_version_id"], :name => "migration_conf_def_from_to"
  add_index "migration_configuration_definitions", ["from_version_id"], :name => "index_migration_configuration_definitions_on_from_version_id"
  add_index "migration_configuration_definitions", ["to_version_id"], :name => "index_migration_configuration_definitions_on_to_version_id"

  create_table "migration_definitions", :force => true do |t|
    t.date     "timeout"
    t.string   "software_update_cloud_id"
    t.string   "software_update_version_id"
    t.boolean  "migrate_configuration"
    t.boolean  "migrate_modules"
    t.boolean  "change_owner"
    t.integer  "owner_id"
    t.boolean  "apply_default_config"
    t.text     "default_config"
    t.boolean  "email_notification"
    t.text     "user_emails_notification"
    t.text     "targeted_assets"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "module_parameters", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "parameterable_id"
    t.string   "parameterable_type"
    t.boolean  "read_only"
    t.string   "value_type"
    t.boolean  "collection",         :default => false, :null => false
  end

  create_table "modules_versions", :force => true do |t|
    t.integer  "asset_module_id"
    t.integer  "authorized_version_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "modules_versions", ["asset_module_id"], :name => "index_modules_versions_on_asset_module_id"
  add_index "modules_versions", ["authorized_version_id"], :name => "index_modules_versions_on_authorized_version_id"

  create_table "monthly_stat_assets", :force => true do |t|
    t.integer  "nb_message_received"
    t.integer  "total_size_message"
    t.integer  "nb_tracking_received"
    t.integer  "total_size_tracking"
    t.integer  "month_key"
    t.integer  "asset_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "monthly_stat_assets", ["asset_id", "month_key"], :name => "by_month_and_asset", :unique => true

  create_table "morpheus_files", :force => true do |t|
    t.integer  "associable_file_id"
    t.string   "associable_file_type"
    t.string   "filename"
    t.string   "type"
    t.binary   "content",              :limit => 16777215
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "morpheus_files", ["associable_file_id", "associable_file_type"], :name => "associable_file_idx"

  create_table "nifty_attachments", :force => true do |t|
    t.integer  "parent_id"
    t.string   "parent_type"
    t.string   "token"
    t.string   "digest"
    t.string   "role"
    t.string   "file_name"
    t.string   "file_type"
    t.binary   "data",        :limit => 16777215
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "notifications", :force => true do |t|
    t.binary   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "account"
    t.string   "imei"
  end

  create_table "paper_versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "paper_versions", ["item_type", "item_id"], :name => "index_paper_versions_on_item_type_and_item_id"

  create_table "parameter_actions", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.integer  "version_id"
    t.text     "actions_then",                          :limit => 16777215
    t.text     "actions_else",                          :limit => 16777215
    t.string   "direction"
    t.string   "initial_key"
    t.text     "condition"
    t.text     "comment"
    t.integer  "migration_configuration_definition_id"
  end

  add_index "parameter_actions", ["migration_configuration_definition_id"], :name => "configuration_definition_id"
  add_index "parameter_actions", ["version_id"], :name => "index_parameter_actions_on_version_id"

  create_table "parameter_translations", :force => true do |t|
    t.string   "original_name"
    t.string   "translate_name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "version_id"
  end

  add_index "parameter_translations", ["version_id"], :name => "index_parameter_translations_on_version_id"

  create_table "parameter_validations", :force => true do |t|
    t.string   "name"
    t.integer  "value_type",      :limit => 1
    t.integer  "value_min_range"
    t.integer  "value_max_range"
    t.string   "list_of_values"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "version_id"
    t.string   "text_error"
    t.text     "comment"
  end

  add_index "parameter_validations", ["version_id"], :name => "index_parameter_validations_on_version_id"

  create_table "parameter_values", :force => true do |t|
    t.binary   "value"
    t.integer  "index"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "module_parameter_id"
    t.string   "name"
    t.boolean  "read_only",           :default => true,  :null => false
    t.boolean  "default",             :default => false, :null => false
    t.boolean  "visible",             :default => false, :null => false
    t.integer  "minimum"
    t.integer  "maximum"
  end

  add_index "parameter_values", ["module_parameter_id"], :name => "index_parameter_values_on_module_parameter_id"

  create_table "parent_configuration_associations", :force => true do |t|
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "permissions", :force => true do |t|
    t.integer "user_id"
    t.string  "role"
  end

  add_index "permissions", ["role"], :name => "index_permissions_on_role"
  add_index "permissions", ["user_id"], :name => "index_permissions_on_user_id"

  create_table "services_actions_at_connection_definitions", :force => true do |t|
    t.integer  "account_id"
    t.text     "configuration_ids"
    t.string   "name"
    t.integer  "created_by_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "locked"
    t.boolean  "generate_assets"
    t.boolean  "migrate_to_version"
    t.boolean  "apply_configuration"
    t.integer  "to_version_id"
    t.boolean  "apply_message"
    t.boolean  "apply_file"
    t.text     "user_file_ids"
    t.text     "user_message_ids"
    t.text     "app_version_ids"
  end

  create_table "services_actions_at_connections", :force => true do |t|
    t.integer  "actions_at_connection_definition_id"
    t.integer  "actions_flow_definition_id"
    t.integer  "created_by_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "label"
    t.text     "targeted_asset_imeis"
    t.text     "from_version_ids"
  end

  add_index "services_actions_at_connections", ["actions_at_connection_definition_id"], :name => "idx_actions_on_connection_definition_id"
  add_index "services_actions_at_connections", ["actions_flow_definition_id"], :name => "idx_actions_flow_on_connection_id"

  create_table "services_asset_allowed_for_remote_files", :force => true do |t|
    t.integer  "state",          :default => 0
    t.integer  "remote_file_id"
    t.integer  "asset_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "services_asset_allowed_for_remote_files", ["remote_file_id", "asset_id"], :name => "idx_asset_allowed_rfs", :unique => true

  create_table "services_models", :force => true do |t|
    t.string   "name"
    t.integer  "start_year"
    t.integer  "end_year"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "version"
    t.string   "fuel"
    t.integer  "vehicle_manufacturer_id"
  end

  add_index "services_models", ["vehicle_manufacturer_id", "name", "version", "start_year", "fuel"], :name => "index_vehmid_name_version_year", :unique => true
  add_index "services_models", ["vehicle_manufacturer_id", "name"], :name => "index_services_models_on_vehicle_manufacturer_id_and_name"

  create_table "services_obd_informations", :force => true do |t|
    t.boolean  "true_mileage"
    t.boolean  "tank_fuel_level"
    t.integer  "script_availability"
    t.string   "ecu"
    t.integer  "model_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "services_obd_informations", ["ecu", "model_id"], :name => "index_services_obd_informations_on_ecu_and_model_id", :unique => true

  create_table "services_remote_file_permissions", :force => true do |t|
    t.integer  "permission_code"
    t.integer  "remote_file_id"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "services_remote_file_permissions", ["remote_file_id"], :name => "index_services_remote_file_permissions_on_remote_file_id"
  add_index "services_remote_file_permissions", ["user_id"], :name => "index_services_remote_file_permissions_on_user_id"

  create_table "services_remote_file_settings", :force => true do |t|
    t.string   "ssh_server"
    t.string   "ssh_port"
    t.string   "ssh_user"
    t.string   "app_name"
    t.string   "namespace"
    t.string   "script"
    t.string   "validation"
    t.integer  "account_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "ssh_port_device"
    t.boolean  "keep_ssh_file"
  end

  add_index "services_remote_file_settings", ["account_id", "namespace"], :name => "index_services_remote_file_settings_on_account_id_and_namespace", :unique => true

  create_table "services_remote_files", :force => true do |t|
    t.string   "remote_file_id",  :null => false
    t.string   "filename"
    t.string   "namespace"
    t.integer  "type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "version"
    t.string   "md5"
    t.string   "description"
    t.integer  "length"
    t.integer  "owner"
    t.integer  "current_user"
    t.integer  "account_id"
    t.integer  "version_id"
    t.integer  "dynamic_form_id"
  end

  add_index "services_remote_files", ["account_id"], :name => "index_services_remote_files_on_account_id"
  add_index "services_remote_files", ["remote_file_id"], :name => "index_rfs_id_on_remote_file", :unique => true

  create_table "services_vehicle_manufacturers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "services_vehicle_manufacturers", ["name"], :name => "index_services_vehicle_manufacturers_on_name", :unique => true

  create_table "smart_link_definitions", :force => true do |t|
    t.integer  "definable_id"
    t.string   "definable_type"
    t.integer  "app_id"
    t.integer  "version_id"
    t.string   "from"
    t.string   "to"
    t.string   "rule"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "selected_by"
  end

  add_index "smart_link_definitions", ["definable_id", "definable_type"], :name => "index_smart_link_definitions_on_definable_id_and_definable_type"

  create_table "targeted_asset_campaigns", :force => true do |t|
    t.integer  "targeted_asset_id"
    t.integer  "campaign_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "targeted_asset_campaigns", ["campaign_id"], :name => "index_targeted_asset_campaigns_on_campaign_id"
  add_index "targeted_asset_campaigns", ["targeted_asset_id"], :name => "index_targeted_asset_campaigns_on_targeted_asset_id"

  create_table "tickets", :force => true do |t|
    t.string   "title"
    t.string   "tags"
    t.text     "content"
    t.text     "small_summary"
    t.string   "status",              :default => "opened"
    t.datetime "expiration_date"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "user_id"
    t.boolean  "restricted_accounts", :default => false
  end

  create_table "user_message_histories", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "dynamic_form_id"
    t.integer  "version_id"
  end

  add_index "user_message_histories", ["dynamic_form_id"], :name => "index_user_message_histories_on_dynamic_form_id"
  add_index "user_message_histories", ["user_id"], :name => "index_user_message_histories_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                    :default => "",    :null => false
    t.string   "encrypted_password",       :default => "",    :null => false
    t.string   "name",                     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",          :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "account_id"
    t.boolean  "munic_io_user",            :default => false, :null => false
    t.boolean  "super_admin",              :default => false, :null => false
    t.string   "api_token"
    t.boolean  "activate_profiling_tools", :default => false
    t.boolean  "access_api",               :default => true
    t.boolean  "dashboard_notif"
    t.boolean  "email_notif"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                                                 :null => false
    t.datetime "updated_at",                                                                 :null => false
    t.string   "kind"
    t.integer  "user_id"
    t.boolean  "public",                                                  :default => false, :null => false
    t.integer  "versionable_id"
    t.string   "versionable_type"
    t.decimal  "number",                  :precision => 15, :scale => 10
    t.string   "cloud_app_name"
    t.decimal  "cloud_app_version",       :precision => 15, :scale => 10
    t.boolean  "complete_component_name"
    t.integer  "priority",                                                :default => 0
    t.boolean  "activate_debug"
    t.string   "cloud_id"
    t.text     "hash_config"
    t.string   "smart_unique_key"
    t.string   "full_name"
    t.boolean  "hidden_version",                                          :default => false
    t.text     "dynamic_list_config"
    t.text     "description"
  end

  add_index "versions", ["full_name"], :name => "index_versions_on_full_name", :unique => true
  add_index "versions", ["smart_unique_key"], :name => "index_versions_on_smart_unique_key", :unique => true
  add_index "versions", ["user_id"], :name => "index_versions_on_user_id"
  add_index "versions", ["versionable_id", "versionable_type"], :name => "index_versions_on_versionable_id_and_versionable_type"
  add_index "versions", ["versionable_type"], :name => "index_versions_on_versionable_type"

  create_table "webtools", :force => true do |t|
    t.string   "name",         :null => false
    t.text     "description"
    t.string   "account_name"
    t.integer  "user_id"
    t.integer  "visibility"
    t.string   "remote_url"
    t.boolean  "is_remote"
    t.string   "version"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
