class RemoveAuthlogicFieldsFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :crypted_password
    remove_column :users, :password_salt
    remove_column :users, :persistence_token
    remove_column :users, :single_access_token
    remove_column :users, :perishable_token
    remove_column :users, :login_count
    remove_column :users, :failed_login_count
    remove_column :users, :last_request_at
    remove_column :users, :current_login_at
    remove_column :users, :last_login_at
    remove_column :users, :current_login_ip
    remove_column :users, :last_login_ip
  end

  def self.down
    add_column :users, :crypted_password, :string
    add_column :users, :password_salt, :string
    add_column :users, :persistence_token, :string
    add_column :users, :single_access_token, :string, :null => false                # optional, see Authlogic::Session::Params
    add_column :users, :perishable_token, :string,    :null => false                # optional, see Authlogic::Session::Perishability
    add_column :users, :login_count, :integer,        :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
    add_column :users, :failed_login_count, :integer, :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
    add_column :users, :last_request_at, :datetime                                    # optional, see Authlogic::Session::MagicColumns
    add_column :users, :current_login_at, :datetime                                   # optional, see Authlogic::Session::MagicColumns
    add_column :users, :last_login_at, :datetime                                      # optional, see Authlogic::Session::MagicColumns
    add_column :users, :current_login_ip, :string                                   # optional, see Authlogic::Session::MagicColumns
    add_column :users, :last_login_ip, :string                                      # optional, see Authlogic::Session::MagicColumns
  end
end
