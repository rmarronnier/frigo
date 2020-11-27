class Fridges::ShowAllPage < MainLayout
  needs fridges : Array(Fridge)

  def content
    h1 "These are your fridges"
    ul
    fridges.each do |fridge|
      li
      link fridge.name, to: Fridges::Show.with(id: fridge.id), flow_id: "show-fridge-button"
      # h3 "Name : #{fridge.name}"
      # h3 "First user : #{fridge.users!.first.email unless fridge.users!.size == 0}"
    end
    link "Create a new fridge", to: Fridges::New, flow_id: "create-fridge-button"
  end
end
