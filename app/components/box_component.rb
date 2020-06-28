class BoxComponent < ViewComponent::Base
  delegate :rich_text_area, to: :helpers

  def initialize(box:)
    @box = box
  end
  
  def submit_action
    "change->boxes#submit" if @box.persisted?
  end
  
  def border_color_transformed(hex_color)
    sliced_hex_color = hex_color[1..-1]
    
    new_hex_color = ""
    if text_color_transformed(hex_color) == "black"
      sliced_hex_color.chars.each_slice(2) do |slice|
        num = slice.join.to_i(16)
        num *= 0.75

        new_hex_color += num.round.to_s(16)
      end
    else
      sliced_hex_color.chars.each_slice(2) do |slice|
        num = slice.join.to_i(16)
        num += (255 - num) * 0.25

        new_hex_color += num.round.to_s(16)
      end
    end

    "##{new_hex_color}"
  end

  def text_color_transformed(hex_color)
    sliced_hex_color = hex_color[1..-1]
    
    total = 0
    sliced_hex_color.chars.each_slice(2) do |slice|
      num = slice.join.to_i(16)
      total += num
    end

    total > 475 ? "black" : "white"
  end
end
