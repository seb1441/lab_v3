module BoxesHelper
  def border_color_transformed(hex_color)
    sliced_hex_color = hex_color[1..-1]

    new_hex_color = ""
    sliced_hex_color.chars.each_slice(2) do |slice|
      num = slice.join.to_i(16)
      if num > 128
        # num *= 0.7
        num -= 30
      else
        # num *= 1.3
        num += 30
      end

      new_hex_color += num.round.to_s(16)
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

    total > 550 ? "black" : "white"
  end
end
