class Cleanup2 < ActiveRecord::Migration[5.1]
  def change
    drop_table :collaborators_wikis
    drop_table :collaborator
    drop_table :wiki
  end
end
