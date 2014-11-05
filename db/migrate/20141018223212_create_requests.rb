class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :req_url
      t.text :description
      t.string :email

      t.timestamps
    end
  end
end
