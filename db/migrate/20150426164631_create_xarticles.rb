class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string :name
    	t.string :attachment
    	t.string :title
    	t.text :fname
        t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

