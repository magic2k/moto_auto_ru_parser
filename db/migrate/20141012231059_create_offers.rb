class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name
      t.string :url
      t.text :description
      t.decimal :year
      t.decimal :price
      t.binary :image
      t.integer :request_id
      t.timestamps
    end
  end
end
