class BoxComponent < ViewComponent::Base
  delegate :rich_text_area, to: :helpers

  def initialize(box:)
    @box = box

    @signed_id = box.persisted? ? box.to_sgid.to_s : ""
  end
  
  def border_color_transformed_old(hex_color)
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

  def border_color_transformed_2(hex_color)
    sliced_hex_color = hex_color[1..-1]

    nums = []
    sliced_hex_color.chars.each_slice(2) { |slice| nums.push slice.join.to_i(16) }

    nums.sort

    if nums[0] < 155
      if (nums[0] + 100) < nums[1]
        nums[0] += 100
      else
        nums[0] = (nums[0] + nums[1] + 100) / 2
        nums[1] = nums[0]
      end
    else
      if (nums[0] - 100) < nums[1]
        nums[0] -= 100
      else
        nums[0] = (nums[0] + nums[1] - 100) / 2
        nums[1] = nums[0]
      end
    end

    "##{nums.map{|n| n.round.to_s(16)}.join}"
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

  def selected_tab_class
    "inline-block border-l border-t border-r rounded-t py-2 px-4 text-teal-600 font-semibold"
  end

  def tab_class
    "inline-block py-2 px-4 text-teal-400 hover:text-teal-800 font-semibold"
  end
end
