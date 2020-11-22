class CreateFridges::V20201121192833 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Fridge) do
      primary_key id : Int64
      add_timestamps
      add name : String
    end
    # alter table_for(User) do
    #   add_belongs_to fridge : Fridge?, on_delete: :do_nothing
    # end
  end

  def rollback
    drop table_for(Fridge)
    # alter table_for(User) do
    #   remove_belongs_to :fridge
    # end
  end
end
