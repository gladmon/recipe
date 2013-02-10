class Initial < ActiveRecord::Migration
  def up
    create_table :food_recipes do |t|
      t.column :name, :string, :null => false
      t.column :description, :string
      t.column :tag_line, :string
      t.column :prep_time, :string
      t.column :servings, :string
      t.column :added_by, :integer
      
      t.timestamps
    end
    
    create_table :users do |t|
      t.column :name, :string, :null => false
      t.timestamps
    end
    
    create_table :steps do |t|
      t.column :food_recipe_id, :integer,  :null => false
      t.column :step_order, :integer, :null => false
      t.column :name, :string, :null => false
      t.timestamps
    end
    
    create_table :ingredients do |t|
      t.column :food_recipe_id, :integer,  :null => false
      t.column :step_order, :integer, :null => false
      t.column :name, :string, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :recipes
    drop_table :users
    drop_table :steps
    drop_table :ingredients
  end
end
