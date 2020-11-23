class Fridges::ShowAll < BrowserAction
  get "/fridges" do
    fridges = FridgeQuery.new.join_users
    html ShowAllPage, fridges: fridges
  end
end
