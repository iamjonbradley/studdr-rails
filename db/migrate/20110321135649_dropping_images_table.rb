class DroppingImagesTable < ActiveRecord::Migration
  def self.up
    drop_table :images
  end
end 

def self.down
  create_table :images do |t| 
    t.string :title
    t.text :body
    t.timestamps
  end 
end 
