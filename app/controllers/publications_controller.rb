class PublicationsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show]

	def index
		authorize Publication
		@publications = Publication.all
		# crear los marcadores para el google maps  
		@hash = create_markers(@publications)
	end

	def show
		@publication = Publication.find(params[:id])
		authorize @publication
		# crea el marcador google maps de la publicación actual
		@hash = create_markers(@publication)
	end

	def new
		authorize Publication
		@publication = Publication.new
	end

	def create
	  @publication = Publication.new(publication_params)
	  @publication.author = current_user
	  authorize @publication
	  
	  begin
		  @publication.save!
		  redirect_to @publication
	  rescue ActiveRecord::RecordInvalid
		  render 'new'
	  end
	end

	def destroy
		@publication = Publication.find(params[:id])
		authorize @publication
		
		@publication.destroy
		redirect_to publications_path
	end

	def edit
		@publication = Publication.find(params[:id])
		authorize @publication
		# crea el marcador google maps de la publicación actual
		@hash = create_markers(@publication)
		
	end

	def update
		@publication = Publication.find(params[:id])
		authorize @publication
		# crea el marcador google maps de la publicación actual
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
		params.require(:publication).permit(:description, :latitude, :longitude, :title, :published, :photo)
	end

	def create_markers(publications)
		 Gmaps4rails.build_markers(publications) do |publication, marker|
			marker.lat publication.latitude
			marker.lng publication.longitude
			marker.infowindow publication.title
		end
	end
	
end
