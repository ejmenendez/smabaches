class PublicationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @publication = Publication.all
  end

    def show
        @publication = Publication.find(params[:id])
    end

    def new
        @publication = Publication.new
    end

  def create
      @publication = Publication.new(publication_params)
      @publication.author = current_user

      begin
          @publication.save!
          redirect_to @publication
      rescue ActiveRecord::RecordInvalid
          render 'new'
      end
  end

    def destroy
        publication = Publication.find(params[:id])
        publication.destroy
        redirect_to publications_path
    end

    def edit
        @publication = Publication.find(params[:id])
    end

    def update
        @publication = Publication.find(params[:id])

      begin
          @publication.update!(publication_params)
          redirect_to @publication
      rescue ActiveRecord::RecordInvalid
          render 'edit'
      end
    end

    private

    def publication_params
        params.require(:publication).permit(:description, :latitude, :longitude,:title)
    end

end
