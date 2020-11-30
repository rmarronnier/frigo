class FridgeView < BaseComponent
  needs fridge : Fridge
  needs current_user_id : Int64

  def render
    section class: "fridge" do
      mount Freezer, fridge: fridge, current_user_id: current_user_id
      hr
      mount Refrigerator, fridge: fridge
    end
  end
end
