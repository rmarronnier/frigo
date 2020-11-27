class Fridges::ShowAll < BrowserAction
  get "/fridges" do
    # fridges = FridgeQuery.new.join_users
    # fridges = FridgeQuery.new.for_user(current_user.id)
    fridges = current_user.fridges!
    if fridges
      html ShowAllPage, fridges: fridges
    else
      redirect to: Home::Index
    end
  end
end
