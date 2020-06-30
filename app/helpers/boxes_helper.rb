module BoxesHelper
  def selected_tab_class(no_p: false)
    "inline-block border-l border-t border-r rounded-t #{"py-2 px-4" unless no_p} text-teal-600 font-semibold"
  end

  def tab_class(no_p: false)
    "inline-block #{"py-2 px-4" unless no_p} text-teal-400 hover:text-teal-800 font-semibold"
  end
end
