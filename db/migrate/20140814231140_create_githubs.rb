class CreateGithubs < ActiveRecord::Migration
  def change
    create_table :githubs do |t|
      t.string :commit_url

      t.timestamps
    end
  end
end
