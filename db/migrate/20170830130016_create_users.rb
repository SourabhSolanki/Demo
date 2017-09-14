class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :mobile
      t.string :password
      t.string :password_confirmation
      t.integer :status , default: 0
      t.timestamps
    end
  end
end
