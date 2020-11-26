class Notes::Quote < BaseComponent
  needs note : Note

  def render
    tag("blockquote") do
      text note.content
      footer do
        i time_ago_in_words(note.created_at) + " ago by " + UserQuery.find(note.user_id).name.to_s
      end
    end
  end
end
