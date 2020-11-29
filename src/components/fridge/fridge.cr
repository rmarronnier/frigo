class FridgeView < BaseComponent
  needs fridge : Fridge
  needs current_user_id : Int64

  def render
    section do
      mount Freezer, fridge: fridge, current_user_id: current_user_id
      mount Refrigerator, fridge: fridge
    end
  end
end
