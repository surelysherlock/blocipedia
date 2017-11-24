class Wikicollaborators < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborators_wikis, id: false do |t|
      t.integer :wiki_id
      t.integer :collaborator_id
      t.timestamps
    end

    add_index :collaborators_wikis, :wiki_id
    add_index :collaborators_wikis, :collaborator_id
  end
end
