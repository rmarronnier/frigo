class CreateNotes::V20201121193056 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Note) do
      primary_key id : Int64
      add_timestamps
      add content : JSON::Any # , fill_existing_with: :nothing
      add_belongs_to user : User, on_delete: :cascade
      add_belongs_to fridge : Fridge, on_delete: :cascade
    end
    # create_index :notes, [:id, :author_id, :fridge_id], unique: true
  end

  def rollback
    drop table_for(Note)
    # drop_index :notes, [:id, :author_id, :fridge_id]
  end
end
