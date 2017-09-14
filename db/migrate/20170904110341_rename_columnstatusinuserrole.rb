class RenameColumnstatusinuserrole < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :status, :role, default: 0
  end
end
