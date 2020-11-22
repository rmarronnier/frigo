class Fridges::NewPage < MainLayout
  needs operation : SaveFridge

  def content
    h1 "Create a new fridge"
    render_sign_up_form(@operation)
  end

  private def render_sign_up_form(op)
    form_for Fridges::Create do
      new_fridge_fields(op)
      submit "Create" # , flow_id: "sign-up-button"
    end
    # link "Sign in instead", to: SignIns::New
  end

  private def new_fridge_fields(op)
    mount Shared::Field, attribute: op.name, label_text: "Name", &.text_input(autofocus: "true")
  end
end
