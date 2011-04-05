class CreateTinyurlsTableAndColumns < ActiveRecord::Migration
  def self.up
    create_table :tinyurls do |t| 
      t.string :url
      t.integer :hits
      t.string :regex
      t.integer :user_id 
      t.timestamps
  end
  
  def self.down
    drop_table :tinyurls 
end
end
