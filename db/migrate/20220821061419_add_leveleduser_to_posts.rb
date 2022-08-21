class AddLeveleduserToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :leveleduser, :text
  end
end
