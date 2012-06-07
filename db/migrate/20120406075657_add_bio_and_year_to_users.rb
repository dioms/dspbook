class AddBioAndYearToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :year, :string
  end
end
