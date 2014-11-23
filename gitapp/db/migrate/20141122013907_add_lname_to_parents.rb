class AddLnameToParents < ActiveRecord::Migration
  def change
    add_column :parents, :lname, :string
  end
end
