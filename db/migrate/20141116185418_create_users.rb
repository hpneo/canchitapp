class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :facebook_uid
      t.string :facebook_token
      t.string :facebook_secret
      t.string :twitter_uid
      t.string :twitter_token
      t.string :twitter_secret

      t.timestamps
    end
  end
end
