class Fridges::New < BrowserAction
  get "/fridges/new" do
    html NewPage, operation: SaveFridge.new
  end
end
