class AddFilenameToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :filename, :string
  end
end
