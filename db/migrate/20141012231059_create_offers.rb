class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name
      t.string :url
      t.text :description
      t.decimal :year
      t.binary :image

      t.timestamps
    end
  end
end
