class ChangeFristNameFirstName < ActiveRecord::Migration
  def self.up
    rename_column :users, :frist_name, :first_name
  end

  def self.down
    rename_column :users, :first_name, :frist_name
  end
end
