class BoxesController < ApplicationController
  before_action :set_box, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  include CableReady::Broadcaster

  def index
    @boxes = Box.includes(:box_category).where(user: current_user)

    @boxes = @boxes.where(box_categories: { name: params[:box_category] }) if params[:box_category]

    @box_categories = BoxCategory.where(user: current_user)

    @new_box = Box.new(boxable: Note.new)
    @new_box.color = current_user.last_used_box_color if current_user.last_used_box_color
    
    @boxes = @boxes.order(position: :asc)
  end

  def show
  end

  def new
    @box = Box.new
  end

  def edit
  end

  def create
    @box = Box.new(box_params)
    @box.user = current_user
    current_user.update(last_used_box_color: box_params[:color]) if current_user.last_used_box_color != box_params[:color]

    @box.box_category = BoxCategory.find_by(name: params.dig("box", "box_category_name")) if params.dig("box", "box_category_name")

    respond_to do |format|
      if @box.save
        channel = "boxes-channel:#{current_user.id}"
        cable_ready[channel].insert_adjacent_html(
          selector: "#newBox",
          position: "afterend",
          html: ApplicationController.render(BoxComponent.new(box: @box))
        )
        cable_ready[channel].set_value(
          selector: "#newBoxName",
          value: ""
        )
        cable_ready[channel].set_value(
          selector: "#newBoxRichText",
          value: ""
        )
        cable_ready.broadcast

        format.json { render json: {}, status: :ok }
      else
        # format.html { render :new }
      end
    end
  end

  def update
    if params[:position]
      @box.insert_at(params[:position].to_i)
      return head :ok
    end

    respond_to do |format|
      if @box.update(box_params)
        format.json { render json: {}, status: :ok }
      else
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @box.destroy

    cable_ready["boxes-channel:#{current_user.id}"].remove(selector: "#box-#{@box.id}")
    cable_ready.broadcast
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_box
      @box = Box.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def box_params
      params.require(:box).permit(:name, :color, :box_category_id, boxable_attributes: [:id, :rich_text])
    end
end
