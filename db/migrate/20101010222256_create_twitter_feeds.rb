class CreateTwitterFeeds < ActiveRecord::Migration
  def self.up
    create_table :twitter_feeds do |t|
      t.string :screen_name
      t.string :auth_token
      t.string :auth_secret
      t.integer :winery_id

      t.timestamps
    end
  end

  def self.down
    drop_table :twitter_feeds
  end
end
