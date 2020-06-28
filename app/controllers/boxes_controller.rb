class BoxesController < ApplicationController
  before_action :set_box, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @boxes = Box.includes(:box_category).where(user: current_user)

    @boxes = @boxes.where(box_categories: { name: params[:box_category] }) if params[:box_category]

    @box_category_names = BoxCategory.where(user: current_user).pluck(:name)

    @new_box = Box.new(boxable: Note.new)
    @new_box.color = current_user.last_used_box_color if current_user.last_used_box_color
    
    @boxes = @boxes.order(created_at: :desc)
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

    respond_to do |format|
      if @box.save
        format.html { redirect_to boxes_path }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @box.update(box_params)
        format.html { redirect_to boxes_path }
        format.json { render :show, status: :ok, location: @box }
      else
        format.html { render :edit }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @box.destroy
    respond_to do |format|
      format.html { redirect_to boxes_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_box
      @box = Box.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def box_params
      params.require(:box).permit(:name, :color, boxable_attributes: [:id, :rich_text])
    end
end
