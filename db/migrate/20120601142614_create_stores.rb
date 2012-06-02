class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :user_id
      t.string :name
      t.string :address
      t.string :university_id
			t.string :delivery_number
      t.string :work_now
      t.string :work_end
      t.string :time_now
      t.string :time_end
      t.string :latitude
      t.string :longnitude
      t.string :avatarstore
      t.text :description

      t.timestamps
    end
  end
end
