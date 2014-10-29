class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.binary :data
      t.string :format
      t.integer :size

      t.references :user, index: true

      t.timestamps
    end
  end
end
