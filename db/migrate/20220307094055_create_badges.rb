class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: :false
      t.string :img_url, null: :false
      t.integer :rule, null: :false, index: true

      t.timestamps
    end
  end
end

