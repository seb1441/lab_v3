class BoxesController < ApplicationController
  before_action :set_box, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @boxes = Box.includes(:box_category).where(user: current_user)

    @boxes = @boxes.where(box_categories: { name: params[:box_category] }) if params[:box_category]

    # @box_category_names = Category.wh
    @box_category_names = BoxCategory.where(user: current_user).pluck(:name)

    @new_box = Box.new(boxable: Note.new)
    
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

    respond_to do |format|
      if @box.save
        format.html { redirect_to boxes_path, notice: 'Box was successfully created.' }
        format.json { render :show, status: :created, location: @box }
      else
        format.html { render :new }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @box.update(box_params)
        format.html { redirect_to @box, notice: 'Box was successfully updated.' }
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
      format.html { redirect_to boxes_url, notice: 'Box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_box
      @box = Box.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def box_params
      params.require(:box).permit(:name, boxable_attributes: [:id, :rich_text])
    end
end
