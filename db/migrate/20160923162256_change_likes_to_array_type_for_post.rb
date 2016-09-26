class ChangeLikesToArrayTypeForPost < ActiveRecord::Migration[5.0]
  def up
    # ActiveRecord::Base.connection.execute('USING likes::json;')
    enable_extension 'hstore'
    change_column :posts, :likes, :json
  end

  def down
    change_column :posts, :likes, :text
  end
end
