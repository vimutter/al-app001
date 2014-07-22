class GadgetsController < ApplicationController
  TRUE = ['1', 'true', true]

  def index
    @gadgets = Gadget.for_user(current_user).page(params[:page]).per(10)
    @panel = TRUE.include?(params[:panel])
  end

end
