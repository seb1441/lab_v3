# frozen_string_literal: true

class NavbarReflex < ApplicationReflex
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #
  # Example:
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com
  def toggle_user_menu
    # @showusermenu = element.dataset[:showusermenu] == "true" ? "false" : "true"
    @showusermenu = session[:showusermenu] = session[:showusermenu] == true ? false : true
    @shownavbarmenu = session[:shownavbarmenu]
  end

  def toggle_navbar_menu
    # @shownavbarmenu = element.dataset[:shownavbarmenu] == 'true' ? false : true
    @shownavbarmenu = session[:shownavbarmenu] = session[:shownavbarmenu] == true ? false : true
  end
end
