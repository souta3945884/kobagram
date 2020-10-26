class ChangeTopicsColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics, :user_id, :integer
    remove_column :topics, :image, :string
  end
end
