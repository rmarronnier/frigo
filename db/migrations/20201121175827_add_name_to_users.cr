class AddNameToUsers::V20201121175827 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(User) do
      add name : String?
      # add_belongs_to fridge : Fridge?, index: true, on_delete: :do_nothing
      # add notes : Array(JSON::Any), fill_existing_with: :nothing
    end

    # create_index :users, [:id, :fridge_id], unique: true
    # Read more on migrations
    # https://www.luckyframework.org/guides/database/migrations
    #
    # create table_for(Thing) do
    #   primary_key id : Int64
    #   add_timestamps
    #
    #   add title : String
    #   add description : String?
    # end

    # Run custom SQL with execute
    #
    # execute "CREATE UNIQUE INDEX things_title_index ON things (title);"
  end

  def rollback
    alter table_for(User) do
      remove :name
      # remove_belongs_to :fridge
    end
    # drop_index :users, [:id, :fridge_id]
  end
end
