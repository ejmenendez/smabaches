class PublicationsController < ApplicationController

  def index
    @publication = Publication.all
  end

  def create

  end

end
