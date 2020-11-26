class SignUps::NewPage < AuthLayout
  needs operation : SignUpUser

  def content
    h1 "Sign Up"
    render_sign_up_form(@operation)
  end

  private def render_sign_up_form(op)
    form_for SignUps::Create do
      sign_up_fields(op)
      submit "Sign Up", flow_id: "sign-up-button"
    end
    link "Sign in instead", to: SignIns::New
  end

  private def sign_up_fields(op)
    mount Shared::Field, attribute: op.email, label_text: "Email", &.email_input(autofocus: "true", attrs: [:required])
    mount Shared::Field, attribute: op.password, label_text: "Password", &.password_input(attrs: [:required])
    mount Shared::Field, attribute: op.password_confirmation, label_text: "Confirm Password", &.password_input(attrs: [:required])
    mount Shared::Field, attribute: op.name, label_text: "Name or cute nickname", placeholder: "John O'TooLazyToChooseAName", &.text_input
  end
end
