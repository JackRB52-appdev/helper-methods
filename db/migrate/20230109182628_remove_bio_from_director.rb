class RemoveBioFromDirector < ActiveRecord::Migration[6.1]
  def change
    remove_column :directors, :bio, :string
  end
end
