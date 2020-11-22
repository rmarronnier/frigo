class Fridges::ShowAll < BrowserAction
  get "/all_fridges" do
    fridges = FridgeQuery.new
    html ShowAllPage, fridges: fridges
  end
end
