class FridgeQuery < Fridge::BaseQuery
  def for_user(user_id)
    self.where_pairings(PairingQuery.new.user_id(user_id))
  end
end
