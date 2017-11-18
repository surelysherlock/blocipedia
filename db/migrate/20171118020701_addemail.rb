class Addemail < ActiveRecord::Migration[5.1]
  def change
    add_column :collaborators_wikis, :email, :string
  end
end
