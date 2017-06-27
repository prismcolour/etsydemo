class RemoveRecipientFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :recipient, :string
  end
end
