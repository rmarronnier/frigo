class Fridges::ShowPage < MainLayout
  needs fridge : Fridge

  def content
    main do
      hr
      section do
        header do
          h1 "This is your fridge"
          h2 "Name : #{fridge.name}"
        end
        h3 "Users :"
        ul
        fridge.users!.each do |user|
          li user.email
        end
        h3 "Notes :"
        ul
        fridge.notes!.each do |note|
          mount Notes::Quote, note: note
          link "Delete", to: Notes::Delete.with(fridge_id: fridge.id, note_id: note.id), flow_id: "delete-note-button"
        end
        h3 "Invites :"
        ul
        fridge.invites!.each do |invite|
          li invite.email
          # link "Delete", to: Notes::Delete.with(fridge_id: fridge.id, note_id: note.id), flow_id: "delete-note-button"
        end
        mount Shared::FridgeActions, fridge: fridge
      end
      # link "Create a new note", to: Notes::New.with(id: fridge.id), flow_id: "create-note-button"
      # text " - "
      # link "Invite someone to this fridge", to: Invites::New.with(id: fridge.id), flow_id: "create-invite-button"
      # text " - "
      # link "Leave this fridge", to: Fridges::Leave.with(id: fridge.id), flow_id: "leave-fridge-button"
    end
    # h3 "Email:  #{@current_user.email}"
    # helpful_tips
  end

  # private def helpful_tips
  #   h3 "Next, you may want to:"
  #   ul do
  #     li { link_to_authentication_guides }
  #     li "Modify this page: src/pages/me/show_page.cr"
  #     li "Change where you go after sign in: src/actions/home/index.cr"
  #   end
  # end

  # private def link_to_authentication_guides
  #   a "Check out the authentication guides",
  #     href: "https://luckyframework.org/guides/authentication"
  # end
end
