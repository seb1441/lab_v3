class BoxesReflex < ApplicationReflex
  def update_box_name(id, name)
    box = Box.find(id)
    box.update(name: name)

    # if box == Box.last
    #   create_box
    # else
      @halted = true
    # end
  end

  def delete_box
    Box.find(element.dataset[:id]).destroy
  end

  def update_note_content(id, content)
    note = Note.find(id)
    note.update(content: content)

    # if note == Note.last
    #   create_box
    # else
      @halted = true
    # end
  end

  def create_box(name, content)
    Box.create(
      name: name,
      user: current_user,
      boxable: Note.create(content: content)
    )
  end
end