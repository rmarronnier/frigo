class Notes::NewPage < MainLayout
  needs operation : SaveNote
  needs associated_fridge : Fridge

  def content
    h1 "Create a new note"
    render_new_note_form(@operation, @associated_fridge)
  end

  private def render_new_note_form(op, fridge)
    form_for Notes::Create.with(@associated_fridge.id) do
      new_note_fields(op)
      submit "Create" # , flow_id: "sign-up-button"
    end
    # link "Sign in instead", to: SignIns::New
  end

  private def new_note_fields(op)
    mount Shared::Field, attribute: op.content, label_text: "Punch gently the plastic squares", &.textarea(autofocus: "true", rows: "10", cols: "20")
    # mount Shared::Field, attribute: op.associated_fridge, label_text: "Content", &.text_input(autofocus: "true")
  end
end
