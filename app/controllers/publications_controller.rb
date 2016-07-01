class PublicationsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show]

	def index
		authorize Publication
		if params[:category].present?
      #buscar por categoría - en este caso asociado al combo de categoría
			@publications = Publication.filter(params[:category])
    elsif params[:search].present?
      # texto de búsqueda del que llega del textbox
			@publications = Publication.search(params[:search])
    elsif params[:swLat].present? && params[:neLat].present? &&
          params[:swLng].present? && params[:neLng].present?
      # objetos de límite de geokit_rails para esquinas NE y SW
      swGeokit = Geokit::LatLng.new(params[:swLat].to_f, params[:swLng].to_f)
      neGeokit = Geokit::LatLng.new(params[:neLat].to_f, params[:neLng].to_f)
      # array con los límites
      bounds = [swGeokit, neGeokit]
      #llamo al método de act_as_mappable para traer las publicaciones dentro del viewport
      @publications = Publication.in_bounds(bounds)
    else
      # criterio de búsqueda por defecto
      @publications = Publication.search(params[:search])
		end
    #si hay usuario logueado, mostrar las publicaciones que le corresponden
    #dentro de las que ya estan filtradas
		if current_user.present?
			@publications_current_user = @publications.select{|p| p.author == current_user}
		end
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

	def report
		@publication = Publication.find(params[:id])
		(User.with_role :admin).each do |user|

			Notifier.complaint_report(user, @publication, current_user).deliver

		end
		redirect_to :back
	end

	private

	def publication_params
		params.require(:publication).permit(:description, :latitude, :longitude, :title, :published, :photo, :category_id, :swLat, :swLng, :neLat, :neLng)
	end
  #creación de los marcadores para google maps de cada una de las publicaciones
  #que están dentro de la colección enviada por parámetro
	def create_markers(publications)
		 Gmaps4rails.build_markers(publications) do |publication, marker|
			marker.lat publication.latitude
			marker.lng publication.longitude
			marker.infowindow publication.title
		end
	end
end
