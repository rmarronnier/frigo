class Fridges::ShowPage < MainLayout
  needs fridge : Fridge
  needs current_user_id : Int64

  def content
    main do
      mount FridgeView, fridge: fridge, current_user_id: current_user_id
      # section do
      #   header do
      #     h1 "This is your fridge"
      #     h2 "Name : #{fridge.name}"
      #   end
      #   h3 "Users :"
      #   ul
      #   fridge.users!.each do |user|
      #     li user.email
      #   end
      #   h3 "Notes :"
      #   ul
      #   fridge.notes!.each do |note|
      #     mount Notes::Quote, note: note
      #     link "Delete", to: Notes::Delete.with(fridge_id: fridge.id, note_id: note.id), flow_id: "delete-note-button"
      #   end
      #   h3 "Invites :"
      #   ul
      #   fridge.invites!.each do |invite|
      #     li invite.email
      #     # link "Delete", to: Notes::Delete.with(fridge_id: fridge.id, note_id: note.id), flow_id: "delete-note-button"
      #   end
      #   mount Shared::FridgeActions, fridge: fridge
      # end
      # link "Create a new note", to: Notes::New.with(id: fridge.id), flow_id: "create-note-button"
      # text " - "
      # link "Invite someone to this fridge", to: Invites::New.with(id: fridge.id), flow_id: "create-invite-button"
      # text " - "
      # link "Leave this fridge", to: Fridges::Leave.with(id: fridge.id), flow_id: "leave-fridge-button"
    end
    # h3 "Email:  #{@current_user.email}"
    # helpful_tips
  end
end
