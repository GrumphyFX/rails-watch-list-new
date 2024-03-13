class RenamePosterUrlToPosterPath < ActiveRecord::Migration[7.1]
  def change
    rename_column :movies, :poster_url, :poster_path
  end
end
