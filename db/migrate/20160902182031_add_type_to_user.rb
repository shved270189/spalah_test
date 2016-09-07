class AddTypeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :type, :string
    User.all.each { |user| user.update(type: user.class.to_s) }
  end
end
