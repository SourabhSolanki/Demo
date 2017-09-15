class AddAvatarColumnsToComments < ActiveRecord::Migration[5.1]
  def up
    add_attachment :comments, :avatar
  end

  def down
    remove_attachment :comments, :avatar
  end
end
