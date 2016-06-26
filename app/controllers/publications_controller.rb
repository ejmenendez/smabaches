class PublicationsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show]
    
	def index
		authorize Publication
		@publications = Publication.filter(params[:category])
		@publications = Publication.search(params[:search])
		# crear los marcadores para el google maps
		@hash = create_markers(@publications)
	end

	def show
		@publication = Publication.find(params[:id])
		authorize @publication
		# crea el marcador google maps de la publicación actual
		@hash = create_markers(@publication)
		commontator_thread_show(@publication)
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
		  redirect_to @publication, 'data-no-turbolink' => true
	  rescue ActiveRecord::RecordInvalid
		  render 'new'
	  end
	end

	def destroy
		@publication = Publication.find(params[:id])
		authorize @publication

		@publication.destroy
		redirect_to publications_path, 'data-no-turbolink' => true
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
		  redirect_to @publication, 'data-no-turbolink' => true
	  rescue ActiveRecord::RecordInvalid
		  render 'edit'
	  end
	end

	#votos para publicaciones
	def upvote
		@publication = Publication.find(params[:id])
		@publication.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@publication = Publication.find(params[:id])
		@publication.downvote_by current_user
		redirect_to :back
	end

	private

	def publication_params
		params.require(:publication).permit(:description, :latitude, :longitude, :title, :published, :photo, :category_id, :nwlat, :nwlng, :selat, :selng)
	end

	def create_markers(publications)
		 Gmaps4rails.build_markers(publications) do |publication, marker|
			marker.lat publication.latitude
			marker.lng publication.longitude
			marker.infowindow publication.title
		end
	end

end
