class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
    	t.references :user, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true
      t.timestamps
    end
  end
end
