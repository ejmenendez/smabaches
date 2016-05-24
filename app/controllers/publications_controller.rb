class PublicationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def index
    @publications = Publication.all  
    @hash = create_markers(@publications)
  end

    def show
        @publication = Publication.find(params[:id])
        @hash = create_markers(@publication)
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
        @hash = create_markers(@publication)
    end

    def update
        @publication = Publication.find(params[:id])
		@hash = create_markers(@publication)
      begin
          @publication.update!(publication_params)
          redirect_to @publication
      rescue ActiveRecord::RecordInvalid
          render 'edit'
      end
    end

    private

    def publication_params
        params.require(:publication).permit(:description, :latitude, :longitude, :title, :published)
    end
    
    def create_markers(publications)
		 Gmaps4rails.build_markers(publications) do |publication, marker|
			marker.lat publication.latitude
			marker.lng publication.longitude
			marker.infowindow publication.title
		end
	end
	
end
