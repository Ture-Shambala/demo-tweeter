class UserIdToPosts < ActiveRecord::Migration
  def change
  	add_reference :posts, :user, foreign_key: true
  end
end
