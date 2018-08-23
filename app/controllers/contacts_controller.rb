class ContactsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: @contacts }
    end
  end

end
