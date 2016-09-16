class AddResumeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :resume, :string
  end
end
