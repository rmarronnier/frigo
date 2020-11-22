class CreateStickings::V20201121223239 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Sticking) do
      primary_key id : Int64
      add_timestamps
      add_belongs_to note : Note, on_delete: :cascade
      add_belongs_to fridge : Fridge, on_delete: :cascade
    end
  end

  def rollback
    drop table_for(Sticking)
  end
end
