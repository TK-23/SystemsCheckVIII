class AddTables < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :description
      t.integer :category_id
      t.integer :author_id, null: false
      t.integer :year, null: false
      t.timestamps
    end

    create_table :authors do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
