class Invites::NewPage < MainLayout
  needs operation : SaveInvite
  needs associated_fridge : Fridge

  def content
    h1 "Invite someone to #{@associated_fridge.name}"
    render_new_invite_form(@operation, @associated_fridge)
  end

  private def render_new_invite_form(op, fridge)
    form_for Invites::Create.with(@associated_fridge.id) do
      new_invite_fields(op)
      submit "Invite" # , flow_id: "sign-up-button"
    end
    # link "Sign in instead", to: SignIns::New
  end

  private def new_invite_fields(op)
    mount Shared::Field, attribute: op.email, label_text: "Email", &.email_input(autofocus: "true")
    # mount Shared::Field, attribute: op.associated_fridge, label_text: "Content", &.text_input(autofocus: "true")
  end
end
