class CreateHackers < ActiveRecord::Migration
  def change
    create_table :hackers do |t|
      t.string :name
      t.text :access_token

      t.timestamps null: false
    end
  end
end
