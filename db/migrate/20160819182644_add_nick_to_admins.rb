class AddNickToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :nick, :string
  end
end
