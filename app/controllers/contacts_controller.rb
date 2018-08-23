class ContactsController < ApplicationController

  def index

# params["number"]

    @contacts = Contact.all
    respond_to do |format|
      format.html
      format.json { render json: @contacts }
    end
  end

end
