class BoxesReflex < ApplicationReflex
  def update_box_name(id, name)
    box = Box.find(id)
    box.update(name: name)

    @halted = true
  end

  def update_box_color(id, color)
    Box.find(id).update(color: color)

    # @halted = true
  end

  def delete_box
    Box.find(element.dataset[:id]).destroy
  end

  def update_note_content(id, content)
    note = Note.find(id)
    note.update(content: content)

    @halted = true
  end

  def create_box(name, content, color)
    box = Box.create(
      name: name,
      user: current_user,
      color: color,
      boxable: Note.create(content: content)
    )
  end

  def submit
    if box = GlobalID::Locator.locate_signed(element.dataset.dig("signed-id"))
      box.assign_attributes(box_params)
      box.save
      @halted = true
    else
      Box.create(box_params)
    end
  end

  private

  def box_params
    params.require(:box).permit(:name, boxable_attributes: [:id, :rich_text])
  end
end