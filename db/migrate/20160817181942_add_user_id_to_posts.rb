class AddUserIdToPosts < ActiveRecord::Migration[5.0]
  def change
    # rails g migration AddUserIdToPosts user:references
    add_reference :posts, :user, foreign_key: true
  end
end
