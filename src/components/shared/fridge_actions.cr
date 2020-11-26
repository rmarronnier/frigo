class Shared::FridgeActions < BaseComponent
  needs fridge : Fridge

  def render
    aside do
      h3 "Actions !"
      para do
        link to: Notes::New.with(id: fridge.id), flow_id: "create-note-button" do
          b "Create a new note"
        end
      end
      para do
        link "Invite someone to this fridge", to: Invites::New.with(id: fridge.id), flow_id: "create-invite-button"
      end
      para do
        link "Leave this fridge", to: Fridges::Leave.with(id: fridge.id), flow_id: "leave-fridge-button"
      end
    end
  end
end
