class AddBioToDirector < ActiveRecord::Migration[6.1]
  def change
    add_column :directors, :bio, :text
  end
end
