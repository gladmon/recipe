class Initial < ActiveRecord::Migration
  def up
    create_table :food_recipes do |t|
      t.column :name, :string, :null => false
      t.column :description, :text
      t.column :tag_line, :string
      t.column :prep_time, :string
      t.column :servings, :string
      t.column :ingredients, :text
      t.column :steps, :text
      t.column :added_by_id, :integer
      t.column :last_made_by_id, :integer
      t.column :last_made, :timestamp
      
      t.timestamps
    end
    
    create_table :users do |t|
      t.column :name, :string, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :food_recipes
    drop_table :users
  end
end
