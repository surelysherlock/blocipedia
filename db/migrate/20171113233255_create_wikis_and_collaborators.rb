class CreateWikisAndCollaborators < ActiveRecord::Migration[5.1]
  def change
    create_table :wiki_collab, id: false do |t|
      t.integer :wiki_id
      t.integer :collaborator_id
      t.timestamps
    end

    add_index :wiki_collab, :wiki_id
    add_index :wiki_collab, :collaborator_id
  end
end
