class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.string :description
      t.string :attachment

      t.timestamps null: false
    end
  end
end
