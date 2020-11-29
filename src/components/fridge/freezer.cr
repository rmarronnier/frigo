class Freezer < BaseComponent
  needs fridge : Fridge
  needs current_user_id : Int64

  def render
    div class: "freezer" do
      h1 fridge.name
      ul class: "fridge_users" do
        fridge.users!.each do |user|
          li class: "user" do
            text "#{user.name} (#{user.email})" if user.id != current_user_id
            text "You" if user.id == current_user_id
            link "Leave this fridge", to: Fridges::Leave.with(id: fridge.id), flow_id: "leave-fridge-button" if user.id == current_user_id
          end
        end
      end
      ul class: "fridge_invites" do
        fridge.invites!.each do |invite|
          li "#{invite.email}"
        end
        li do
          link "Invite someone to this fridge", to: Invites::New.with(id: fridge.id), flow_id: "create-invite-button"
        end
      end
    end
  end
end
