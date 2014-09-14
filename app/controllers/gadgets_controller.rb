class GadgetsController < ApplicationController
  TRUE = ['1', 'true', true]

  def index
    @gadgets = Gadget.for_user(current_user).page(params[:page]).per(10)
    @panel = TRUE.include?(params[:panel])
  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = Gadget.new gadget_attributes
    @gadget.save

    respond_with @gadget
  end

  protected

  def gadget_attributes
    params.require(:gadget).
      permit(:name, :description, picture_attributes: [:image])
  end
end
