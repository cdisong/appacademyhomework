class BandsController < ApplicationController

  def index #(GET)
    #shows everything )All bands)

    render :index
  end
  #-DIFFERENT BUT THE SAME----
  def show #(GET)
    #shows one instance of band
    @band = Band.find_by(name: name)

  end

  #-CONNECTED-
  def new #(GET)v
    #form that user fills out to make something
    render :new
  end

  def create #(POST)
    #makes user filled out form and saves to database
    @band = Band.find_by(name: name)

  end
  #-CONNECTED-

  #---CONNECTED---
  def edit #(GET)
    #form filled out for client editing

  end

  def update #(PATCH)
    #taking form filled out by client (edit) saving to database
  end
  #---CONNECTED---

  def destroy #(DELETE)
    #opposite of create
  end
end
