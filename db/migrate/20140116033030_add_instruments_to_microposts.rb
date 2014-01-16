class AddInstrumentsToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :drums, :boolean
    add_column :microposts, :vocals, :boolean
    add_column :microposts, :bass, :boolean
    add_column :microposts, :guitar, :boolean
    add_column :microposts, :keyboards, :boolean
    add_column :microposts, :production, :boolean
    add_column :microposts, :songwriting, :boolean
  end
end
