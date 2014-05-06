class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :username
      t.string :message

      t.timestamps
    end
  end
end
