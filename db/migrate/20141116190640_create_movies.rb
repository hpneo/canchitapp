class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster_path
      t.string :year
      t.string :api_id
      t.text :overview
      t.string :director
      t.text :cast

      t.timestamps
    end
  end
end
