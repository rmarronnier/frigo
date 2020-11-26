class CreateInvites::V20201124192330 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Invite) do
      primary_key id : Int64
      add_timestamps
      add email : String
      add_belongs_to fridge : Fridge, on_delete: :cascade
    end
  end

  def rollback
    drop table_for(Invite)
  end
end
