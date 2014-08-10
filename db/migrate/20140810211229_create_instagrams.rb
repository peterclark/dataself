class CreateInstagrams < ActiveRecord::Migration
  def change
    create_table :instagrams do |t|
      t.string :image_url
      t.string :location

      t.timestamps
    end
  end
end
