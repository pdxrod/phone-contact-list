class ContactsController < ApplicationController

  def index
  end

  def search
    string = params["string"] ? params["string"].to_s.downcase : ""
    @contacts = Contact.locate string
    respond_to do |format|
      format.html
      format.json { render json: @contacts }
    end
  end

end
